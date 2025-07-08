function [data, auxData, metaData, txtData, weights] = mydata_Cacatua_moluccensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Cacatua_moluccensis'; 
metaData.species_en = 'Salmon-crested cockatoo'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 28.5;    units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'EoL';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'Swee2000';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'full cease of feeding at 77 d';
data.tp = 135;    units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'full cease of feeding at 77 d';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Swee2000';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '3 till 4 yrs';
data.am = 65.8*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 16.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Swee2000';
  comment.Wwb = '14 till 20 g';
data.Wwi = 850;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Wiki';

data.Ri = 2/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 1 eggs/clutch; breeds once per 2 yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.057	16.746
1.030	16.530
3.079	19.796
3.951	23.322
4.721	30.589
5.440	34.149
6.466	41.360
7.645	44.818
8.929	55.691
10.264	68.412
11.651	84.840
12.938	106.869
14.584	128.819
16.127	154.511
17.570	185.803
18.807	211.562
19.942	241.063
21.284	276.096
22.627	314.849
24.073	359.156
25.261	394.224
26.139	418.203
27.229	468.169
28.623	506.910
29.865	553.122
30.797	588.247
32.034	614.006
33.067	645.389
34.407	674.844
34.978	700.751
35.907	726.578
36.939	752.383
38.121	765.138
39.309	802.065
40.235	814.876
41.160	825.829
42.190	846.055];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Swee2000';
comment.tW = 'Data digitized from curve';
  
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
D1 = 'Body temperatures are guessed';
D2 = 'Poor fit of growth if scaled functional responds is constant; therefor it is assumed to vary';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'P57H'; % Cat of Life
metaData.links.id_ITIS = '554841'; % ITIS
metaData.links.id_EoL = '45511260'; % Ency of Life
metaData.links.id_Wiki = 'Cacatua_moluccensis'; % Wikipedia
metaData.links.id_ADW = 'Cacatua_moluccensis'; % ADW
metaData.links.id_Taxo = '54180'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '0B5492FA03FB597B'; % avibase
metaData.links.id_birdlife = 'salmon-crested-cockatoo-cacatua-moluccensis'; % birdlife
metaData.links.id_AnAge = 'Cacatua_moluccensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cacatua_moluccensis}}';
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
bibkey = 'Swee2000'; type = 'Article'; bib = [ ... 
'author = {R. G. Sweeney}, ' ... 
'year = {2000}, ' ...
'title = {Husbandry and breeding and hand-rearing of the salmon crested cackatoo \emph{Cacatua moluccensis} at {Loro Parque Fundaci\''{o}n, Puerto de la Cruz}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {37}, ' ...
'pages = {130-137}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cacatua_moluccensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1178085/details}}';
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

