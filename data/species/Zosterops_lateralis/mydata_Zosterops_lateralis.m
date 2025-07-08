function [data, auxData, metaData, txtData, weights] = mydata_Zosterops_lateralis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Zosteropidae';
metaData.species    = 'Zosterops_lateralis'; 
metaData.species_en = 'Silvereye';

metaData.ecoCode.climate = {'A','BWh','BWk','Cwa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTht', '0iThh'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs','biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 12;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SandCoul2022';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '10-14 d';
data.tx = 12;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SandCoul2022';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '10-15 d';
data.tp = 36;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '10-15 d';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.6;      units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'guess';
data.Wwb = 1.1;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 12.5;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
 
data.Ri  = 3/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SandCoul2022';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 eggs per clutch; assumed: 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.966	2.897
1.966	3.983
1.980	1.513
1.980	2.494
1.995	3.370
1.995	3.527
1.995	5.419
1.995	5.962
2.010	0.988
2.010	2.004
2.010	4.508
2.010	4.963
2.970	6.979
2.970	5.455
2.970	5.000
2.970	4.474
3.000	3.476
3.015	2.513
3.975	5.982
3.975	7.506
3.975	7.996
3.990	2.024
3.990	3.057
3.990	4.493
3.990	4.931
3.990	6.980
3.990	9.012
4.005	3.495
4.005	3.986
4.005	5.492
4.005	6.455
4.966	6.999
4.980	8.033
4.995	6.491
4.995	6.019
4.995	4.040
5.970	6.020
5.985	7.491
5.985	7.981
5.985	9.470
5.985	10.468
5.985	10.994
6.000	4.444
6.000	9.032
6.000	10.013
6.015	4.934
6.015	6.475
6.015	6.983
6.015	8.489
6.946	9.559
6.961	10.505
6.990	7.475
6.990	5.006
7.020	8.999
7.995	9.526
7.995	10.489
7.995	10.979
7.995	11.469
7.995	12.555
8.010	6.496
8.010	7.004
8.010	7.564
8.010	7.967
8.010	8.983
8.010	10.033
8.025	8.510
9.000	11.611
9.000	10.981
9.015	8.529
9.030	4.991
9.975	11.017
9.990	10.527];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'SandCoul2022';

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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5D8MW'; % Cat of Life
metaData.links.id_ITIS = '917124'; % ITIS
metaData.links.id_EoL = '45518709'; % Ency of Life
metaData.links.id_Wiki = 'Zosterops_lateralis'; % Wikipedia
metaData.links.id_ADW = 'Zosterops_lateralis'; % ADW
metaData.links.id_Taxo = '57909'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '27A57A03744EB709'; % avibase
metaData.links.id_birdlife = 'silvereye-zosterops-lateralis'; % birdlife
metaData.links.id_AnAge = 'Zosterops_lateralis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zosterops_lateralis}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Zosterops_lateralis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SandCoul2022'; type = 'article'; bib = [ ... 
'doi = {10.1080/01584197.2022.2105723}, ' ...
'title = {Insular nestling growth and its relationship to parental care effort in Silvereyes, \emph{Zosterops lateralis}}, ' ...
'journal = {Emu}, ' ...
'year = {2022}, ' ...
'author = {Erik M. Sandvig and Tim Coulson and Bruce C. Robertson and William E. Feeneyd and Sonya M. Clegg}, ' ...
'pages = {1-10}'];
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

