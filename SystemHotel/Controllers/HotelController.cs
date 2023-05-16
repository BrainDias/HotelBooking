﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SystemHotel.Services;
using SystemHotel.Models;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;

namespace SystemHotel.Controllers
{
    public class HotelController : Controller
    {
        private readonly FindHotelsService findHotels = new FindHotelsService(new HotelContext());

        // GET: Hotel_Controller
        public ActionResult actionSearch()
        {
            var lstModels = findHotels.GetDropDownList();
            
            int selectedIndex = 1;

            ViewBag.Countries = new SelectList(
                lstModels.Result.listOfcountries, "Id", "Name", selectedIndex);

            ViewBag.Regions = new SelectList(lstModels.Result.listOfregions.Where(
                b => b.FkCountryId == selectedIndex || b.Id == 0), "Id", "Name", selectedIndex);

            ViewBag.Cities = new SelectList(lstModels.Result.listOfcities.Where(
                c => c.FkRegionId == selectedIndex || c.Id == 0), "Id", "Name");

            return View();
        }

        // GET: Hotel/GetCities/
        public ActionResult GetCities(int id)
        {
            return PartialView(findHotels._dbContext.Cities.Where(
                c => c.FkRegionId == id || c.CityId == 0).ToList());
        }

        // GET: Hotel/GetCountries/
        public ActionResult GetRegions(int id)
        {
            return PartialView(findHotels._dbContext.Regions.Where(
                c => c.FkCountryId == id || c.RegionId == 0).ToList());
        }

        // GET: Hotel/Search
        public ActionResult Search(int id)
        {
            return PartialView(findHotels._dbContext.Hotels.Where(s => s.FkCityId == id).ToList());
        }

        
        
        
        // GET: Hotel/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }





        // GET: Hotel_Controller/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Hotel_Controller/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Hotel_Controller/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Hotel_Controller/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
