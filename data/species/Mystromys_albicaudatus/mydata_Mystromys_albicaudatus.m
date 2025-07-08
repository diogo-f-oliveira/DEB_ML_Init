function [data, auxData, metaData, txtData, weights] = mydata_Mystromys_albicaudatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Nesomyidae';
metaData.species    = 'Mystromys_albicaudatus'; 
metaData.species_en = 'White-tailed rat'; 

metaData.ecoCode.climate = {'BWk', 'BSk', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(33); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 01];              

%% set data
% zero-variate data

data.tg = 38;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(33);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 32;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(33);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 109;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(33); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(33); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 6.5;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 40;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 106;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3*3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(33); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; assumed 3 litter per yr';

% univariate data
data.tWw = [ ... % time since birth (d), weight (g)
0.826	7.131
1.932	7.365
2.910	8.447
4.010	10.012
4.931	10.369
6.099	10.482
7.077	11.564
8.059	12.041
9.038	13.123
9.954	14.447
10.933	15.408
11.974	16.247
12.954	17.087
13.998	17.443
14.982	17.436
15.960	18.639
16.995	20.689
18.101	21.044
19.081	21.763
20.184	22.723
21.042	23.322
22.212	23.072
23.124	25.001
23.968	28.382
25.013	28.496
26.114	29.698
27.030	31.143
27.947	32.105
29.058	31.492
30.028	34.147
30.937	36.923
31.925	36.190
33.021	38.360
33.999	39.442
35.038	40.765
35.839	40.518];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(33);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Mees1970';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '45FQN'; % Cat of Life
metaData.links.id_ITIS = '632756'; % ITIS
metaData.links.id_EoL = '1179534'; % Ency of Life
metaData.links.id_Wiki = 'Mystromys_albicaudatus'; % Wikipedia
metaData.links.id_ADW = 'Mystromys_albicaudatus'; % ADW
metaData.links.id_Taxo = '62552'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000113'; % MSW3
metaData.links.id_AnAge = 'Mystromys_albicaudatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mystromys_albicaudatus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mystromys_albicaudatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mees1970'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1378296}, ' ...
'author = {Meester, J. and Hallett, A. F.}, ' ... 
'year = {1970}, ' ...
'title = {Notes on Early Postnatal Development in Certain {S}outhern {A}frican {M}uridae and {C}ricetidae}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {51(4)}, ' ...
'pages = {703–711}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

