function [data, auxData, metaData, txtData, weights] = mydata_Kurixalus_idiootocus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Rhacophoridae';
metaData.species    = 'Kurixalus_idiootocus'; 
metaData.species_en = 'Temple tree frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 11 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 02]; 
%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 90; units.tp = 'd';    label.tp = 'time since metam at puberty';    bibkey.tp = 'guess';
  comment.tp = 'guess based on Hyla arborea';
data.am = 22*365;units.am = 'd';    label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Hyla arborea';

data.Li  = 3.7;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';                 bibkey.Li  = 'EoL';
  comment.Li = '24 to 43 mm, males being somewhat smaller than females';
data.Lim  = 3.4;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';               bibkey.Lim  = 'EoL';
  comment.Lim = '24 to 43 mm, males being somewhat smaller than females';

data.Wwb = 0.023; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'ChanTsen2014';
data.Wwj = 0.34;   units.Wwj = 'g'; label.Wwj = 'wet weight at metam';            bibkey.Wwj = 'ChanTsen2014';
data.Wwi = 1.95;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on Li and L-Ww relationship of Hyla arborea: (3.7/5)^3*4.8';
data.Wwim = 1.5;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';          bibkey.Wwim = {'EoL','guess'};
  comment.Wwim = 'based on Li and L-Ww relationship of Hyla arborea: (3.4/5)^3*4.8';

data.Ri  = 3*180/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 4.5 cm SVL'; bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '180 eggs per clutch, but 3 clutches per season assumed';
 
% uni-variate data
% time-weight
data.tW1 = [ ... % time since hatch (d), weight (g)
0.0029	0.0234
1.8583	0.0336
3.9521	0.0497
5.8565	0.0722
7.9506	0.0902
9.9986	0.1212
11.9041	0.1522
13.9512	0.1754
15.9986	0.2012
17.9559	0.2679
20.0028	0.2892
22.0020	0.3098
23.9554	0.3440
26.0473	0.3438]; 
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'weight', 'fed each 1 d'};  
temp.tW1    = C2K(17);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'LianHuan2002';
comment.tW1 = 'tapoles were fed each 1 d';
% time-weight
% time-weight
data.tW2 = [ ... % time since hatch (d), weight (g)
0.1933	0.0253
2.0484	0.0336
4.0928	0.0334
6.0431	0.0423
7.9927	0.0448
10.0380	0.0524
11.9405	0.0587
13.8426	0.0618
15.9834	0.0733
17.9800	0.0712
19.9305	0.0814
22.0236	0.0916
24.0689	0.0992
26.0674	0.1127]; 
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'weight', 'fed each 2 d'};  
temp.tW2    = C2K(17);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'LianHuan2002';
comment.tW2 = 'tapoles were fed each 2 d';
% time-weight
data.tW4 = [ ... % time since hatch (d), weight (g)
0.1458	0.0260
1.8580	0.0317
3.9498	0.0302
6.0417	0.0300
7.9436	0.0318
9.9408	0.0342
11.9371	0.0301
14.0298	0.0371
15.8364	0.0363
18.0242	0.0426
19.9259	0.0424
22.0182	0.0455
24.0149	0.0447
26.0599	0.0503]; 
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'weight', 'fed each 4 d'};  
temp.tW4    = C2K(17);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4  = 'LianHuan2002';
comment.tW4 = 'tapoles were fed each 4 d';
% time-weight
data.tW8 = [ ... % time since hatch (d), weight (g)
0.1458	0.0260
1.8578	0.0297
4.0922	0.0282
5.9939	0.0281
8.0383	0.0279
9.9401	0.0290
11.9370	0.0295
14.0288	0.0280
15.8359	0.0324
17.9281	0.0348
19.8776	0.0366
22.0171	0.0364
24.0614	0.0362
26.1059	0.0374]; 
units.tW8   = {'d', 'g'};  label.tW8 = {'time since birth', 'weight', 'fed each 8 d'};  
temp.tW8    = C2K(17);  units.temp.tW8 = 'K'; label.temp.tW8 = 'temperature';
bibkey.tW8  = 'LianHuan2002';
comment.tW8 = 'tapoles were fed each 8 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = 3 * weights.tW1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW4','tW8'}; subtitle1 = {'Tadpoles fed each 1, 2, 4, 8 d'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'the 14 d feeding regime obviously required adaptation';
metaData.discussion = struct('D1',D1,'D2',D2);  

%% Facts
F1 = 'Eggs are deposited in a depressions in the ground, under stones, in crevices or holes and are sometimes covered with dead leaves. Hatching does not take place until heavy rainfall occurs and the depression fills up or the tadpoles get washed into the nearby ditch, pond or temporary pool. Tadpoles are herbivorous';
metaData.bibkey.F1 = {'Wiki','EoL'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RG4K'; % Cat of Life
metaData.links.id_ITIS = '665498'; % ITIS
metaData.links.id_EoL = '332267'; % Ency of Life
metaData.links.id_Wiki = 'Kurixalus_idiootocus'; % Wikipedia
metaData.links.id_ADW = 'Kurixalus_idiootocus'; % ADW
metaData.links.id_Taxo = '844080'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Kurixalus+idiootocus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kurixalus_eiffingeri}}';
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
bibkey = 'LianHuan2002'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0952836902000249}, ' ...
'author = {M.-F. Liang and C.-H. Huang and Y.-C. Kam}, ' ... 
'year = {2002}, ' ...
'title = {Effects of intermittent feeding on the growth of oophagous (\emph{Chirixalus eiffingeri}) and herbivorous (\emph{Chirixalus idiootocus}) tadpoles from {T}aiwan}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {256}, ' ...
'pages = {207-213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/332267/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

