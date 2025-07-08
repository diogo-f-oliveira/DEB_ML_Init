function [data, auxData, metaData, txtData, weights] = mydata_Myotis_myotis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Myotis_myotis'; 
metaData.species_en = 'Greater mouse-eared bat'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 09]; 


%% set data
% zero-variate data

data.tg = 65;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time siince birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 502;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 37.1*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.9; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 28.55;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 4 to 10 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight data 
data.tWw = [ ... time (d), weight (g)
0.811	5.931
0.815	6.745
0.964	5.350
7.536	9.429
7.697	10.475
7.703	11.638
7.709	12.685
14.885	12.926
15.037	12.113
15.056	15.834
15.204	14.322
15.209	15.136
22.399	18.052
22.399	18.052
22.404	19.099
22.543	15.843
22.548	16.774
29.270	19.573
29.277	20.852
29.283	22.015
29.285	22.480
29.286	22.712
29.413	17.015
29.449	24.108
29.454	25.038
29.460	26.201
35.981	20.396
36.144	21.675
36.171	26.907
36.309	23.419
36.314	24.466
36.333	27.954
43.158	20.754
43.170	22.963
43.177	24.358
43.185	25.870
43.188	26.568
43.196	27.963
50.036	23.553
50.041	24.600
50.047	25.763
50.062	28.670
50.181	21.460
57.522	23.330
57.536	26.121
57.542	27.284
57.552	29.144
57.558	30.307
64.090	26.595
64.113	31.130
64.253	27.990
64.255	28.455
64.258	28.920
64.261	29.502
70.949	25.906
71.112	27.185
71.122	29.162
77.826	28.473
77.831	29.403
84.056	26.737
84.067	28.830
84.075	30.458];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', ' wet weight'};  
temp.tWw   = C2K(35);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Paz1986';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

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
metaData.links.id_CoL = '8LZKY'; % Cat of Life
metaData.links.id_ITIS = '1157322'; % ITIS
metaData.links.id_EoL = '327665'; % Ency of Life
metaData.links.id_Wiki = 'Myotis_myotis'; % Wikipedia
metaData.links.id_ADW = 'Myotis_myotis'; % ADW
metaData.links.id_Taxo = '168961'; % Taxonomicon
metaData.links.id_WoRMS = '1049378'; % WoRMS
metaData.links.id_MSW3 = '13802497'; % MSW3
metaData.links.id_AnAge = 'Myotis_myotis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myotis_myotis}}';
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
bibkey = 'Paz1986'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mamm.1986.50.2.243}, ' ...
'author = {Oscar de Paz}, ' ... 
'year = {1986}, ' ...
'title = {Age estimation and postnatal growth of the Greater Mouse bat \emph{Myotis myotis} ({B}orkhausen, 1797) in {G}uadalajara, {S}pain}, ' ...
'journal = {Mammalia}, ' ...
'volume = {50(2)}, ' ...
'pages = {243-252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Myotis_myotis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

