function [data, auxData, metaData, txtData, weights] = mydata_Nezumia_sclerorhynchus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Nezumia_sclerorhynchus'; 
metaData.species_en = 'Rough-tip grenadier'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1 = [2024 07 29];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 29];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = '13 to 17 cm';
data.Li  = 36;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'FernRami2013';
  comment.Wwb = 'based on egg diameter of 1.3 mm of Nezumia_aequalis: pi/6*0.13^3';

data.Ri  = 15713/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Nezumia_aequalis from the Atlantic';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), pre-anal length (cm)
 2 1.63
 3 2.25
 4 2.67
 5 3.24
 6 3.79
 7 4.15
 8 4.49
 9 4.69
10 4.81];
data.tL(:,1) = 365*data.tL(:,1); % convert yr to d
data.tW = data.tL; % copy to calculate weights
data.tL(:,2) = 3.54*data.tL(:,2); % convert pre-anal length to total length
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LabrPapa2000';

% time-weight
data.tW(:,2) = 0.0024 * (data.tW(:,2) * 10).^2.52;
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LabrPapa2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Pre-anal length PL of tL-data has been converted to total length TL = 3.54 * PL based on photo';
D2 = 'fishbase gives 12.3C as preferred temperature, which seems high in view of depth';
D3 = 'mod_1: reproduction data revised on the basis of Nezumia_aequalis';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'preferred temp 8 C; bathypelagic; depth range 180 - 2600 m, usually 400 - 1200 m';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.0024 * (LPA in mm)^2.52';
metaData.bibkey.F2 = 'LabrPapa2000'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '47C4P'; % Cat of Life
metaData.links.id_ITIS = '165398'; % ITIS
metaData.links.id_EoL = '46564628'; % Ency of Life
metaData.links.id_Wiki = 'Nezumia'; % Wikipedia
metaData.links.id_ADW = 'Nezumia_sclerorhynchus'; % ADW
metaData.links.id_Taxo = '181312'; % Taxonomicon
metaData.links.id_WoRMS = '126475'; % WoRMS
metaData.links.id_fishbase = 'Nezumia-sclerorhynchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nezumia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LabrPapa2000'; type = 'Article'; bib = [ ... 
'author = {M. Labropoulou and C. Papaconstantinou}, ' ... 
'year = {2000}, ' ...
'title = {Comparison of otolith growth and somatic growth in two macrourid fishes}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {46}, ' ...
'pages = {177-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Nezumia-sclerorhynchus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

