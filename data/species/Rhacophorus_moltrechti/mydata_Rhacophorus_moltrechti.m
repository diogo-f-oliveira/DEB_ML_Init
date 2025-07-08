function [data, auxData, metaData, txtData, weights] = mydata_Rhacophorus_moltrechti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Rhacophoridae';
metaData.species    = 'Rhacophorus_moltrechti'; 
metaData.species_en = 'Moltrech''s green treefrog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'T-aj'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 31];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 31]; 

%% set data
% zero-variate data

data.ab = 10;     units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*30.5; units.tp = 'd';    label.tp = 'time since metam at puberty';    bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Hyla arborea';
data.am = 22*365;units.am = 'd';    label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Hyla arborea';

data.Li  = 5.6;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';                   bibkey.Li  = 'Wiki';
  comment.Li = '5 to 6 cm';

data.Wwb = 0.036; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'ChanTsen2014';
data.Wwj = 0.8;   units.Wwj = 'g'; label.Wwj = 'wet weight at metam';            bibkey.Wwj = 'ChanTsen2014';
data.Wwi = 6.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on Li and L-Ww relationship of Hyla arborea: (5.5/5)^3*4.8';

data.Ri  = 3*200/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 4.5 cm SVL'; bibkey.Ri  = 'sunmoonlake';   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '100 to 300 eggs per clutch, but multiple clutches per season (3 assumed)';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since hatch (d), weight (g)
1.002	0.036
5.896	0.073
12.927	0.121
19.756	0.216
26.931	0.340
33.826	0.416
40.933	0.537
47.966	0.619
54.998	0.676
62.035	0.793]; 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(17);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ChanTsen2014';

% time-larval stage
data.Ttj = [ ... % temperature (C), time since hatch at metam (d)
17 63
22 42
27 35]; 
units.Ttj   = {'C', 'd'};  label.Ttj = {'temperature', 'time since birth at metam'};  
bibkey.Ttj  = 'ChanTsen2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 2 * weights.tW;
weights.Ttj = 2 * weights.Ttj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Females slightly larger than males, but no adequat data found';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5D4MJ'; % Cat of Life
metaData.links.id_ITIS = '665658'; % ITIS
metaData.links.id_EoL = '1019266'; % Ency of Life
metaData.links.id_Wiki = 'Zhangixalus_moltrechti'; % Wikipedia
metaData.links.id_ADW = 'Rhacophorus_schlegelii'; % ADW
metaData.links.id_Taxo = '149358'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Zhangixalus+moltrechti'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhacophorus_moltrechti}}';
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
bibkey = 'ChanTsen2014'; type = 'Article'; bib = [ ... 
'author = {Y.-M. Chang and W.-H. Tseng and C.-C. Chen and C.-H. Huang and Y.-F. Chen and K. A. Hatch}, ' ... 
'year = {2014}, ' ...
'title = {Winter breeding and high tadpole densities may benefit the growth and development of tadpoles in a subtropical lowland treefrog}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {294}, ' ...
'pages = {154-160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sunmoonlake'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sunmoonlake.gov.tw/English/DepthExperienceEng/AboutSMLEng/EcologyEng/EcologyEng04.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
