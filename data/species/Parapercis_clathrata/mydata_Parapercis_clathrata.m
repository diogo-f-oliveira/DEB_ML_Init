function [data, auxData, metaData, txtData, weights] = mydata_Parapercis_clathrata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Pinguipedidae';
metaData.species    = 'Parapercis_clathrata'; 
metaData.species_en = 'Latticed sandperch'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 05];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ThilMcIl2016';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';
  
data.Lp  = 11;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 24;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.9 mm: pi/6*0.09^3'; 
data.Wwp  = 10.6;  units.Wwp  = '9';  label.Wwp  = 'weight at puberty'; bibkey.Wwp  = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00692*Lp^3.06, see F1';
data.Wwi  = 116;  units.Wwi  = '9';  label.Wwi  = 'ultimate weight for females'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.06, see F1';

data.Ri = 26e3/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.95';

% uni-variate data
% time-length
data.tL = [  ... % yr class (yr), total length (cm)
0.976	13.004
1.030	12.255
1.111	10.892
2.031	17.493
2.032	14.155
2.033	13.474
2.034	13.133
2.035	12.997
2.036	12.384
2.060	16.130
2.061	15.790
2.062	15.313
2.063	14.904
2.087	16.539
3.008	14.830
3.031	14.080
3.032	16.260
3.033	16.805
3.034	17.282
3.035	17.827
3.036	18.508
3.037	19.053
3.062	18.167
3.956	18.978
3.957	18.434
4.038	17.888
4.065	14.959
5.013	19.244
5.014	17.813
5.041	18.358
7.995	19.292];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ThilMcIl2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_my','tL_mg'}; subtitle1 = {'Data females, yellow and gray males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6TR6R'; % Cat of Life
metaData.links.id_ITIS = '170960'; % ITIS
metaData.links.id_EoL = '46573404'; % Ency of Life
metaData.links.id_Wiki = 'Parapercis_clathrata'; % Wikipedia
metaData.links.id_ADW = 'Parapercis_clathrata'; % ADW
metaData.links.id_Taxo = '183000'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Parapercis-clathrata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parapercis_clathrata}}';
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
bibkey = 'ThilMcIl2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-015-1367-y}, ' ...
'author = {Thillainath, E.C. and J.L. McIlwain and S.K. Wilson and M. Depczynski}, ' ... 
'year = {2016}, ' ...
'title = {Estimating the role of three mesopredatory fishes in coral reef food webs at {N}ingaloo {R}eef, {W}estern {A}ustralia}, ' ...
'journal = {Coral Reefs}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Parapercis-clathrata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

