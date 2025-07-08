function [data, auxData, metaData, txtData, weights] = mydata_Heteromys_pictus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Heteromyidae';
metaData.species    = 'Heteromys_pictus'; 
metaData.species_en = 'Painted spiny pocket mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf','0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 12];              

%% set data
% zero-variate data

data.tg = 25;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'EiseIsaa1963';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '24-28';
data.tx = 21;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'EiseIsaa1963';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 98;  units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'EiseIsaa1963';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'EiseIsaa1963';
data.Wwi = 55;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EiseIsaa1963';

data.Ri  = 2*4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 pups per litter; 2 litters per yr assumed';

% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
5.139	2.926
5.147	3.975
5.150	4.394
9.417	4.594
9.850	5.537
11.346	6.058
13.275	7.312
16.267	8.249
16.272	8.879
16.723	12.339
17.984	9.819
19.951	16.423
20.333	10.233
20.346	12.016
22.317	19.249
23.144	15.576
23.362	16.310
23.391	20.296
24.012	17.672
25.750	22.178
30.892	25.523
39.005	26.763
39.025	29.490
39.032	30.434
58.054	36.264
64.714	43.066
65.107	38.345
65.946	36.455
73.018	41.159
145.837	54.416
180.784	50.243
181.194	47.935];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'EiseIsaa1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are slightly larger than females';
metaData.bibkey.D1 = 'Wiki'; 
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6QGZX'; % Cat of Life
metaData.links.id_ITIS = '625236'; % ITIS
metaData.links.id_EoL = '311779'; % Ency of Life
metaData.links.id_Wiki = 'Heteromys_pictus'; % Wikipedia
metaData.links.id_ADW = 'Liomys_pictus'; % ADW
metaData.links.id_Taxo = '62085'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12700192'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heteromys_pictus}}';
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
bibkey = 'EiseIsaa1963'; type = 'Article'; bib = [ ...  
'doi = {10.2307/1377168}, ' ...
'author = {Eisenberg, J. F., & Isaac, D. E.}, ' ...
'year = {1963}, ' ...
'title  = {The Reproduction of Heteromyid Rodents in Captivity}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {44(1)}, ' ...
'pages = {61-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

