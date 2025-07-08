function [data, auxData, metaData, txtData, weights] = mydata_Sula_nebouxii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Sulidae';
metaData.species    = 'Sula_nebouxii'; 
metaData.species_en = 'Blue-footed booby'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 41;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Body temp from ShalWhit1973 as target, but varies considerably';
data.tx = 100; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Data for S. sula, 91 till > 139 d';
data.tp = 300; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for S. sula, 91 till > 139 d';
data.tR = 2.5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(40.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for S. sula, 2-3 yr';
data.am = 18*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 46; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DuffRick1981';
data.Wwi = 1580; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'DuffRick1981';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'AnAge: 1 clutch/yr';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.004	45.948
0.931	83.271
3.129	97.560
4.986	195.194
7.992	200.833
16.125	726.403
23.191	901.437
25.975	1027.774
27.938	1001.841
31.979	921.236
34.075	1125.184
35.014	1300.438
39.052	1193.971
43.115	1420.836
46.111	1291.418
53.071	1590.019
58.045	1635.817
66.134	1589.550
80.117	1522.955];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'DuffRick1981';
comment.tW = 'Data from Lobos de Tierra 1979';
  
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
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '53FBH'; % Cat of Life
metaData.links.id_ITIS = '174702'; % ITIS
metaData.links.id_EoL = '45509067'; % Ency of Life
metaData.links.id_Wiki = 'Sula_nebouxii'; % Wikipedia
metaData.links.id_ADW = 'Sula_nebouxii'; % ADW
metaData.links.id_Taxo = '51663'; % Taxonomicon
metaData.links.id_WoRMS = '343959'; % WoRMS
metaData.links.id_avibase = '649F85B5CED953D5'; % avibase
metaData.links.id_birdlife = 'blue-footed-booby-sula-nebouxii'; % birdlife
metaData.links.id_AnAge = 'Sula_nebouxii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sula_nebouxii}}';
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
bibkey = 'DuffRick1981'; type = 'Article'; bib = [ ... 
'author = {D. C. Duffy and R. E. Ricklefs }, ' ... 
'year = {1981}, ' ...
'title = {Observations on Growth of Blue-footed Boobies and Development of Temperature Regulation in {P}eruvian Guano Birds}, ' ...
'journal = {JOURNAL OF FIELD ORNITHOLOGY}, ' ...
'volume = {52}, ' ...
'pages = {332--336}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sula_nebouxii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Sula_sula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShalWhit1973'; type = 'Article'; bib = [ ... 
'author = {R. J. Shallenberger and G. C. Whittow and R. M. Smith }, ' ... 
'year = {1973}, ' ...
'title = {BODY TEMPERATURE OF THE NESTING RED-FOOTED BOOBY (\emph{Sula sula}) }, ' ...
'journal = {Can. Wildl. Serv. Rept. Ser.}, ' ...
'volume = {17}, ' ...
'pages = {36}'];
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

