function [data, auxData, metaData, txtData, weights] = mydata_Grallaricula_ferrugineipectus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Grallariidae';
metaData.species    = 'Grallaricula_ferrugineipectus'; 
metaData.species_en = 'Rusty-breasted antpitta'; 

metaData.ecoCode.climate = {'A','Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2022 09 13];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 17;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'NiklAret2008';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '16-17.5 d';
data.tx = 13.3;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'NiklAret2008';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '12-14 d';
data.tp = 39.9;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '12-14 d';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 2.78;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';       bibkey.Ww0 = 'NiklAret2008';
  comment.Ww0 = '2.4-3.02 g';
data.Wwb = 2.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NiklAret2008';
data.Wwi = 16.48;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'NiklAret2008';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'NiklAret2008';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, assumed: assumed: 1 clutch per year';
 
% uni-variate data
% time-weight
data.tW = [ ... % imte since birth (d), wet weight (g)
0.971	3.734
0.992	2.427
0.993	2.083
1.010	3.219
1.011	2.943
1.012	2.703
1.945	4.878
1.946	4.293
1.947	3.915
2.006	3.089
2.027	1.748
2.939	5.196
2.940	4.749
2.959	5.402
2.960	4.439
2.980	3.992
3.017	5.678
3.036	5.953
3.972	6.615
3.973	5.377
4.015	3.313
4.905	8.893
4.945	8.171
4.946	7.621
4.984	8.412
4.986	6.693
5.956	11.138
5.978	9.281
5.996	10.279
5.997	9.487
5.998	9.006
6.019	7.630
6.970	11.628
6.971	11.181
7.008	12.282
7.009	11.938
7.943	12.875
7.944	12.325
7.946	10.915
7.964	12.084
7.965	11.775
7.986	10.536
8.024	11.328
8.027	9.195
8.975	14.810
8.976	13.882
8.997	12.987
9.952	13.890
9.972	13.546
9.973	13.305
9.990	14.681
10.012	12.687
10.052	11.965
10.053	11.173
11.998	15.387
12.000	14.286
12.001	13.804
12.002	13.495];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'NiklAret2008';

%% set weights for all real data
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
D2 = 'Males are supposed not to differ from females';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3H5PD'; % Cat of Life
metaData.links.id_ITIS = '560307'; % ITIS
metaData.links.id_EoL = '45512883'; % Ency of Life
metaData.links.id_Wiki = 'Grallaricula_ferrugineipectus'; % Wikipedia
metaData.links.id_ADW = 'Grallaricula_ferrugineipectus'; % ADW
metaData.links.id_Taxo = '78876'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'E95533575B9D307B'; % avibase
metaData.links.id_birdlife = 'rusty-breasted-antpitta-grallaricula-ferrugineipectus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pyrrholaemus_sagittatus}}';
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
bibkey = 'NiklAret2008'; type = 'Article'; bib = [ ... 
'author = {Alina M. Niklison and Juan I. Areta and Roman A. Ruggera and Karie L. Decker and Carlos Bosque and Thomas E. Martin}, ' ... 
'year = {2008}, ' ...
'title = {Natural History and Breeding Biology of the Rusty-Breasted Antpitta (\emph{Grallaricula ferrugineipectus})}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {120(2)}, ' ...
'pages = {345-352}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E95533575B9D307B&sec=lifehistory}}';
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

