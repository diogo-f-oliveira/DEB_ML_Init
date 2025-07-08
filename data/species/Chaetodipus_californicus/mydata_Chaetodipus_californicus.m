function [data, auxData, metaData, txtData, weights] = mydata_Chaetodipus_californicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Heteromyidae';
metaData.species    = 'Chaetodipus_californicus'; 
metaData.species_en = 'California pocket mouse'; 

metaData.ecoCode.climate = {'BWh','BSh'};
metaData.ecoCode.ecozone = {'THn'};
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
data.tx = 23;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'EiseIsaa1963';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;  units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 1.4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'EiseIsaa1963';
data.Wwi = 30;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EiseIsaa1963';

data.Ri  = 2*3.3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EiseIsaa1963';
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-5 pups per litter; 2 litters per yr assumed';

% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
1.717	1.570
2.781	1.253
5.132	1.877
6.201	2.294
6.845	2.817
9.191	2.811
9.410	3.650
10.475	3.438
11.338	4.904
13.683	4.689
15.829	6.572
17.961	6.462
18.404	8.769
18.408	9.398
25.689	13.577
32.535	16.603
38.494	14.806
39.591	19.104
39.607	21.412
50.276	22.121
57.527	22.104
90.588	22.656
90.647	30.943
96.388	28.517];
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

%% Links
metaData.links.id_CoL = 'TBSW'; % Cat of Life
metaData.links.id_ITIS = '552491'; % ITIS
metaData.links.id_EoL = '1037971'; % Ency of Life
metaData.links.id_Wiki = 'Chaetodipus_californicus'; % Wikipedia
metaData.links.id_ADW = 'Chaetodipus_californicus'; % ADW
metaData.links.id_Taxo = '93450'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12700220'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetodipus_californicus}}';
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

