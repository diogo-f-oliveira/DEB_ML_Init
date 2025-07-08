function [data, auxData, metaData, txtData, weights] = mydata_Rhaebo_blombergi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Rhaebo_blombergi'; 
metaData.species_en = 'Blomberg''s toad'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jF', 'jiF'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 05]; 


%% set data
% zero-variate data

data.ab = 5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on expectations, given Wwb';
data.tj = 141;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'guess';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'guess based on expectations, given Wwj';
data.tp = 912;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on expectations, given Wwp';
data.am = 28.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 21;   units.Li  = 'cm';  label.Li  = 'ultimate body length for females';   bibkey.Li  = 'SmitFish1975';
  comment.Li = 'Wiki: 20 till 25 cm';
data.Lim  = 16;   units.Lim  = 'cm';  label.Lim  = 'ultimate body length for males';   bibkey.Lim  = 'Wiki';
  comment.Lim = '15 till 17 cm';

data.Wwb = 0.001; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SmitFish1975';
  comment.Wwb = 'based on egg width of 1 mm and egg length of 2 mm: pi/6*0.1^2*0.2';
data.Wwj = 4.9; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'guess';
  comment.Wwp = 'guess based on same relative weight, compared to Bufo bufo: 1135*0.35/80';
data.Wwp = 815;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on same relative weight, compared to Bufo bufo: 1135*60/80';
data.Wwi = 1135;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SmitFish1975';

data.Ri  = 3e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SmitFish1975';   
temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '1 brood/year';
 
% uni-variate data
% time-length
data.tL = [ ... % time since hatch, body length (cm)
42.827	1.087
68.749	2.033
138.253	2.417
177.613	4.944
237.959	6.105
295.934	9.342];
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SmitFish1975';
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0;
weights.tj = 0;
weights.tp = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4RY8V'; % Cat of Life
metaData.links.id_ITIS = '773675'; % ITIS
metaData.links.id_EoL = '331046'; % Ency of Life
metaData.links.id_Wiki = 'Rhaebo_blombergi'; % Wikipedia
metaData.links.id_ADW = 'Rhaebo_blombergi'; % ADW
metaData.links.id_Taxo = '989058'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rhaebo+blombergi'; % AmphibiaWeb
metaData.links.id_AnAge = 'Rhaebo_blombergi'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bufo_bufo}}';
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
bibkey = 'SmitFish1975'; type = 'Article'; bib = [ ... 
'author = {Smith, R. J. and Fischer, H. M.}, ' ... 
'doi = {10.1111/j.1748-1090.1975.tb01360.x}, ' ...
'year = {1975}, ' ...
'title = {Breeding and rearing the {C}olombian giant toad at {L}os {A}ngeles {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {15}, ' ...
'pages = {87--89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/331046/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
