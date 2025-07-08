function [data, auxData, metaData, txtData, weights] = mydata_Fregata_magnificens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Fregatidae';
metaData.species    = 'Fregata_magnificens'; 
metaData.species_en = 'Magnificent frigatebird'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA', 'MPE'};
metaData.ecoCode.habitat = {'0xTf', '0iMi', 'xiFl', 'xiFp'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 56;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 27;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ToboOsor2006';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 81;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1826;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 34*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 80;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ToboOsor2006';
data.Wwi = 1350; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ToboOsor2006';
  comment.Wwi = 'Wiki: 1.1 to 1.59 kg; EoL: 1.36 to 1.815 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (wk) weight (g)
1.135	88.695
3.669	336.101
4.092	379.310
4.746	461.890
5.705	540.342
6.701	602.968
7.667	776.230
8.703	858.587
9.780	1000.179
10.740	1082.580
11.774	1141.234
12.733	1231.537
13.765	1254.637
14.724	1333.088
15.679	1360.183
16.673	1391.206
17.741	1394.532
18.807	1366.254
19.720	1338.065
20.787	1325.589
21.777	1305.256
22.766	1269.122
23.717	1240.911
24.717	1354.894
25.813	1212.030
26.774	1329.986
27.655	1376.878];
data.tW(:,1) = 7 * (data.tW(:,1)-.5); % convert wk to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ToboOsor2006';
  
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
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>; varying food';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Males tend to be slightly smaller than females';
metaData.bibkey.F1 = 'ToboOsor2006'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6JM8B'; % Cat of Life
metaData.links.id_ITIS = '174763'; % ITIS
metaData.links.id_EoL = '45511363'; % Ency of Life
metaData.links.id_Wiki = 'Fregata_magnificens'; % Wikipedia
metaData.links.id_ADW = 'Fregata_magnificens'; % ADW
metaData.links.id_Taxo = '51729'; % Taxonomicon
metaData.links.id_WoRMS = '343999'; % WoRMS
metaData.links.id_avibase = '8AA3B42E976C7B2A'; % avibase
metaData.links.id_birdlife = 'magnificent-frigatebird-fregata-magnificens'; % birdlife
metaData.links.id_AnAge = 'Fregata_magnificens'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fregata_magnificens}}';
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
bibkey = 'ToboOsor2006'; type = 'Article'; bib = [ ... 
'author = {E. Tob\''{o}n and J. L. Osorno}, ' ... 
'year = {2006}, ' ...
'title = {CHICK GROWTH VARIABILITY AND PARENTAL PROVISIONING IN THE MAGNIFICENT FRIGATEBIRD}, ' ...
'journal = {The Condor}, ' ...
'volume = {108}, ' ...
'pages = {612--622}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Fregata_magnificens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1048653/overview}}';
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

