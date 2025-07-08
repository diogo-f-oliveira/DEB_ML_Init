function [data, auxData, metaData, txtData, weights] = mydata_Milvus_migrans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Milvus_migrans'; 
metaData.species_en = 'Black kite'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfa','Dfb','Dfb','Dwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biCva', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 19];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 32;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '30-34 d';
data.tx = 44;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'VeigHira1990';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 132;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 24*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 52;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
data.Wwi = 850;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 807;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'avibase';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.812	87.729
8.388	226.672
13.817	425.017
20.397	552.095
26.105	667.370
32.202	747.024
38.086	722.879
43.954	740.262];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'VeigHira1990';

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
D1 = 'body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '43DZH'; % Cat of Life
metaData.links.id_ITIS = '175469'; % ITIS
metaData.links.id_EoL = '45515828'; % Ency of Life
metaData.links.id_Wiki = 'Milvus_migrans'; % Wikipedia
metaData.links.id_ADW = 'Milvus_migrans'; % ADW
metaData.links.id_Taxo = '52438'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'C1C255AA01C58664'; % avibase
metaData.links.id_birdlife = 'black-kite-milvus-migrans'; % birdlife
metaData.links.id_AnAge = 'Milvus_migrans'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Milvus_milvus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Milvus_milvus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C1C255AA01C58664&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VeigHira1990'; type = 'Article'; bib = [ ...  
'title = {Food Habits and the Survival and Growth of Nestlings in Two Sympatric Kites (\emph{Milvus milvus} and \emph{Milvus migrans})}, ' ...
'author = {J. P. Veiga and F. Hiraldo}, ' ...
'journal = {Holarctic Ecology}, ' ...
'year = {1990}, ' ...
'volume = {13(1)}, ' ...
'pages = {62-71}'];
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

