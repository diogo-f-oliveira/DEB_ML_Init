function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_macrostomus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_macrostomus'; 
metaData.species_en = 'Malabar tongue sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 02];

%% set data
% zero-variate data
data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(28.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ManoVive2014';  
  temp.am = C2K(28.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10.2;   units.Lp = 'cm';  label.Lp = 'total length at puberty';      bibkey.Lp = 'ManoVive2014';
data.Li = 30;  units.Li = 'cm';   label.Li = 'ultimate total length';        bibkey.Li = 'fishbase';

data.Wwb = 1.28e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BhalNirm2018';
  comment.Wwb = 'based on egg diameter of 0.625 mm: pi/6*0.0625^3';
data.Wwp = 3.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00417*Lp^2.90, see F1';
data.Wwi = 80; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00417*Li^2.90, see F1';

% uni-variate data
% time-length        
data.tL = [ ... % age (d), total length (cm)
287.380	7.318
318.644	8.082
348.333	7.827
365+14.977	9.291
365+46.267	9.164
365+72.730	9.482
365+102.001	9.800
365+130.879	9.864
365+163.765	9.991
365+256.785	11.200
365+286.062	11.327
365+316.937	11.645
365+348.218	11.836
730+14.502	11.900
730+133.604	12.727
730+164.482	12.982
730+256.317	13.555
730+287.187	14.064];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ManoVive2014'; 

% length-weight-fecundity
data.LWN = [ ... total length (cm), weight (g), fecundity (#)
    9.0  3.95 3280 
   13.2 11 8140 
   13.2 12.48 24960 
   15.9  7.99 8215 
   15.8 19.8 29480 
   11.3  7.15 5035 
   13.7 13.69 31860 
   14.9 17.48 31005 
   12.3  7.84 8000 
   15   16.84 39680 
   14.7 15.95 22256 
   14   12.5 9702 
   13.5 13.89 4872 
   12    8.42 2800 
   10.8  5.28 1677 
   13   10.08 6512 
   13.7 11.14 5530 
   14.5 15.14 42000 
   11.9  6.85 17848 
   14.1 12.88 32100 
   15   16.3 31500 
   13.9 13.35 32200 
   11.8 11.02 7777 
   13.8 16.46 43639 
   14   15.79 14028];
units.LWN = {'cm', 'g','#'}; label.LWN = {'total length', 'weight', 'fecundity'};  
temp.LWN = C2K(28.4);  units.temp.LWN = 'K'; label.temp.LWN = 'temperature';
bibkey.LWN = 'BhalNirm2018'; treat.LWN = {1 {'weight','fecundity'}};
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00417*(TL in cm)^2.90';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C5ZH'; % Cat of Life
metaData.links.id_ITIS = '616332'; % ITIS
metaData.links.id_EoL = '46570059'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_macrostomus'; % ADW
metaData.links.id_Taxo = '172565'; % Taxonomicon
metaData.links.id_WoRMS = '274211'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-macrostomus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus}}';
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
bibkey = 'ManoVive2014'; type = 'article'; bib = [ ...
'author = {Manojkumar, P.P. and E. Vivekanandan and P.U. Zacharia and R.J. Nair and P.P. Pavithran}, ' ...
'year = {2014}, ' ...
'title = {Fishery of flatfishes with observations on the biology and stock assessment of the {M}alabar sole, \emph{Cynoglossus macrostomus} {N}orman, 1928 exploited off {K}erala coast}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {61(4)}, ' ...
'pages = {35-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BhalNirm2018'; type = 'article'; bib = [ ...
'author = {Bhalekar P.V. and Nirmale V.H. and Metar S.Y. and Pawar R.A. and Kende D.R.}, ' ...
'year = {2018}, ' ...
'title = {Studies on feeding and reproductive biology of {M}alabar tongue sole, \emph{Cynoglossus macrostomus} ({N}orman, 1928) along the {R}atnagiri coast of {M}aharashtra}, ' ... 
'journal = {Indian Journal of Geo Marine Sciences}, ' ...
'volume = {47(6)}, ' ...
'pages = {1217-1221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-macrostomus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
