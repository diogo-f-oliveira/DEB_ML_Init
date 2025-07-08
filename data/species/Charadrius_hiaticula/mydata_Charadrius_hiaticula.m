function [data, auxData, metaData, txtData, weights] = mydata_Charadrius_hiaticula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Charadrius_hiaticula'; 
metaData.species_en = 'Common ringed plover'; 

metaData.ecoCode.climate = {'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 24.5;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Harr1975';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '23 to 26 d';
data.tx = 25;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Harr1975';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20.8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 6.8;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AnAge';
data.Wwi = 64;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '42 till 64 g';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.012	8.951
0.015	7.621
0.046	7.016
0.047	6.412
0.526	7.509
0.733	9.206
0.766	7.634
0.882	9.330
0.885	7.999
0.887	7.032
0.941	10.057
1.005	8.002
1.092	9.455
1.096	7.761
1.244	8.732
1.305	8.128
1.725	8.378
1.933	9.470
1.934	8.986
1.936	8.018
1.961	10.438
2.056	8.021
2.835	9.003
2.959	7.190
2.977	13.118
2.979	11.908
2.982	10.699
2.985	8.884
3.783	15.310
4.002	11.201
4.114	15.316
4.810	12.546
4.888	18.354
4.890	17.508
4.894	15.814
4.925	14.847
4.933	11.218
5.050	12.551
5.465	15.582
5.466	14.736
5.556	14.979
6.955	21.174
6.957	20.206
7.020	18.393
7.945	21.676
7.954	17.079
7.976	21.193
8.965	22.178
8.967	21.211
8.971	19.275
9.063	18.309
9.100	29.439
9.888	25.945
9.948	26.067
10.881	25.237
11.046	32.861
11.893	29.489
11.935	23.684
13.005	29.147
14.976	49.747
14.978	48.537
15.772	41.778
15.844	35.972
15.965	35.370
15.989	38.757
16.022	36.943
16.054	35.976
17.000	43.614
19.914	58.304
19.925	37.498
19.947	56.611];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Pien1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'TMWY'; % Cat of Life
metaData.links.id_ITIS = '176504'; % ITIS
metaData.links.id_EoL = '45509155'; % Ency of Life
metaData.links.id_Wiki = 'Charadrius_hiaticula'; % Wikipedia
metaData.links.id_ADW = 'Charadrius_hiaticula'; % ADW
metaData.links.id_Taxo = '53597'; % Taxonomicon
metaData.links.id_WoRMS = '212619'; % WoRMS
metaData.links.id_avibase = 'EDA37B7C5D4A25ED'; % avibase
metaData.links.id_birdlife = 'common-ringed-plover-charadrius-hiaticula'; % birdlife
metaData.links.id_AnAge = 'Charadrius_hiaticula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Charadrius_hiaticula}}';
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
bibkey = 'Pien1984'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1984.tb07994.x}, ' ...
'author = {M. W. Pienkowski}, ' ... 
'year = {1984}, ' ...
'title = {Behaviour of young Ringed Plovers \emph{Charadrius hiaticula} and its relationship to growth and survival to reproductive age}, ' ...
'journal = {Ibis}, ' ...
'volume = {16}, ' ...
'pages = {133-155}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Charadrius_hiaticula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1975'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {C. Harrisin}, ' ...
'year = {1975}, ' ...
'title  = {A field guide to the nests, eggs and nestlings of {B}ritish and {E}uropean birds}, ' ...
'publisher = {Collins, London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

