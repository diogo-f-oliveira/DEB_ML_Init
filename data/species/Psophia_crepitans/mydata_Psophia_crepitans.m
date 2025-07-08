function [data, auxData, metaData, txtData, weights] = mydata_Psophia_crepitans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Gruiformes'; 
metaData.family     = 'Psophiidae';
metaData.species    = 'Psophia_crepitans'; 
metaData.species_en = 'Grey-winged trumpeter'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'xiTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 27.9;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HornHutc1988';   
  temp.ab = C2K(36);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 45;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'HornHutc1988';   
  temp.tx = C2K(39.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 135;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'HornHutc1988';
  temp.tR = C2K(39.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(39.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 40;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HornHutc1988';
data.Wwi = 1300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'HornHutc1988';   
  temp.Ri = C2K(39.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'HornHutc1988: 4 till 10 eggs per clutch; Wiki: 3 till 4 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ...
0.092	40.798
0.963	47.916
7.060	69.356
8.194	90.671
10.023	90.717
10.025	110.230
14.120	140.489
14.212	183.063
15.081	168.894
20.135	208.047
20.136	218.690
20.137	229.333
20.141	264.810
22.931	298.583
24.060	273.778
29.910	431.798
30.076	350.206
30.079	376.813
31.206	337.817
40.971	467.555
41.064	517.225
50.910	584.880
50.911	595.523
58.929	670.227
59.007	588.633
65.104	611.847];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HornHutc1988';
  
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
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4PLBR'; % Cat of Life
metaData.links.id_ITIS = '176202'; % ITIS
metaData.links.id_EoL = '45512160'; % Ency of Life
metaData.links.id_Wiki = 'Psophia_crepitans'; % Wikipedia
metaData.links.id_ADW = 'Psophia_crepitans'; % ADW
metaData.links.id_Taxo = '53287'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'BCBFFF6A2798E83E'; % avibase
metaData.links.id_birdlife = 'grey-winged-trumpeter-psophia-crepitans'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psophia_crepitans}}';
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
bibkey = 'HornHutc1988'; type = 'Article'; bib = [ ... 
'author = {C. L. Horning and M. Hutchins and W. English}, ' ... 
'year = {1988}, ' ...
'title = {Breeding and management of the common trumpeter (\emph{Psophia crepitans})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {6}, ' ...
'pages = {139--160}']; 
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

