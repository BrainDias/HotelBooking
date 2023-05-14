﻿using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace SystemHotel.Models
{
    public class CityModel : SettlementsAbstractModel
    {
        public int FkRegionId { get; set; }
        public CityModel(int id, string name, int idRegion) : base(id, name) {
            this.FkRegionId = idRegion;
        }
        public CityModel() : base() { }

        public async Task<List<CityModel>> GetEntities()
        {
            return await _dbContext.Cities.Select(
                    s => new CityModel(s.CityId, s.CityName, s.FkRegionId)).ToListAsync();
        }
    }
}