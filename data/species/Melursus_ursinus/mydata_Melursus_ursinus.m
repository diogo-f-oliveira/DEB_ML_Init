function [data, auxData, metaData, txtData, weights] = mydata_Melursus_ursinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Ursidae';
metaData.species    = 'Melursus_ursinus'; 
metaData.species_en = 'Sloth bear'; 

metaData.ecoCode.climate = {'Am', 'BS'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 30]; 

%% set data
% zero-variate data

data.tg = 198;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 76;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 33.3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 400;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 105e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
data.Wwim = 145e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';

data.Ri  = 1.5/365/3;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 1-2 pups each 3 yr';
 
% uni-variate data
% time-weight
data.tW_1 = [ ... % time since birth (d), body weight (g)
71.761	5638.917
101.262	8142.819
127.575	11261.811
159.468	16241.675
187.774	17012.901
217.276	29039.772
276.279	45549.342
323.721	49803.185
336.478	54639.656
367.973	61968.934];
units.tW_1 = {'d', 'g'};  label.tW_1 = {'time since birth', 'wet weight'};  
temp.tW_1  = C2K(38.1);  units.temp.tW_1 = 'K'; label.temp.tW_1 = 'temperature';
bibkey.tW_1 = 'AZA2019';
comment.tW_1 = 'Data for Zoo 3, parent reared';
%
data.tW_2 = [ ... % time since birth (d), body weight (g)
15.150	1746.650
19.535	1998.517
27.110	2501.025
31.495	2876.568
41.462	3505.217
49.037	4378.748
55.017	4508.583
61.395	4886.181
69.767	5636.863
128.771	12870.816
159.867	17973.535
216.877	30770.810
275.880	48393.454
323.721	52895.059
338.073	56867.446
368.372	63948.142];
units.tW_2 = {'d', 'g'};  label.tW_2 = {'time since birth', 'wet weight'};  
temp.tW_2  = C2K(38.1);  units.temp.tW_2 = 'K'; label.temp.tW_2 = 'temperature';
bibkey.tW_2 = 'AZA2019';
comment.tW_2 = 'Data for Zoo 3, parent reared';

  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_1 = 3 * weights.tW_1;
weights.tW_2 = 3 * weights.tW_2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_1','tW_2'}; subtitle1 = {'Data for zoo 3, parent reared'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6QY9D'; % Cat of Life
metaData.links.id_ITIS = '621848'; % ITIS
metaData.links.id_EoL = '328075'; % Ency of Life
metaData.links.id_Wiki = 'Melursus_ursinus'; % Wikipedia
metaData.links.id_ADW = 'Melursus_ursinus'; % ADW
metaData.links.id_Taxo = '66537'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000947'; % MSW3
metaData.links.id_AnAge = 'Melursus_ursinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melursus_ursinus}}';
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
bibkey = 'AZA2019'; type = 'techreport'; bib = [ ... 
'author = {AZA Bear Taxon Advisory Group}, ' ... 
'year = {2019}, ' ...
'title = {Sloth Bear Care Manual}, ' ...
'institution = {Silver Spring, MD: Association of Zoos and Aquariums}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Melursus_ursinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

