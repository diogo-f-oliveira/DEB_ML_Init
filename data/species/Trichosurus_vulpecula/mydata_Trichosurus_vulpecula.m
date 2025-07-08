function [data, auxData, metaData, txtData, weights] = mydata_Trichosurus_vulpecula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Phalangeridae';
metaData.species    = 'Trichosurus_vulpecula'; 
metaData.species_en = 'Common brushtail possum'; 

metaData.ecoCode.climate = {'BSh','BSk','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA','TAz'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 01]; 

%% set data
% zero-variate data

data.tg = 17;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 204;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 315;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 730;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';   bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.279;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 740;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 2395;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 litters per yr, 1 pup per litter';

% uni-variate data

% time-length data
data.tL = [ ... % time (d), head+body length (cm)
224.341	25.071
254.413	31.272
286.584	33.434
315.903	35.735
345.186	38.244
377.630	38.805
407.209	39.574
439.676	39.994
470.669	40.763
497.549	40.766
531.573	40.351
559.879	40.284
590.872	41.053
621.901	41.613
651.728	40.920
682.733	41.619
713.632	42.945
743.424	42.461
774.417	43.230
802.463	44.695
834.848	45.603
867.587	44.422
895.940	44.077
927.229	43.105
955.216	44.918
987.837	44.434
1017.617	44.019
1048.587	44.927
1079.757	44.652
1110.976	44.097
1143.254	45.633
1199.925	45.151];
data.tL(:,1) = data.tL(:,1) + 70; % correct for unknown birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'head+body length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kean1975';

% time-weight data
data.tWw = [ ... % time (d), weight (g)
227.663	645.368
251.619	878.902
285.567	892.370
316.599	1119.791
346.209	1366.061
377.308	1429.815
408.350	1632.057
439.481	1613.977
467.798	1558.055
498.912	1584.040
532.829	1673.047
561.106	1717.843
590.662	2096.306
623.188	2128.622
651.571	1909.032
681.245	1997.930
713.758	2061.720
744.830	2188.423
774.488	2315.090
805.638	2252.946
832.456	2404.719
866.521	2128.622
896.202	2198.634
924.484	2230.841
955.434	2659.699
989.390	2654.283
1019.198	2409.550
1051.691	2523.700
1079.993	2505.547
1109.692	2531.495
1142.187	2639.350
1204.455	2590.602];
data.tWw(:,1) = data.tWw(:,1) + 70; % correct for unknown birth
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight', 'post pouch'};  
temp.tWw  = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Kean1975';
%
data.tWw_j = [ ... % time (d), weight^(1/3) (g^(1/3))
1.849	0.598
2.877	0.799
6.073	0.679
13.187	0.907
17.597	1.484
18.716	1.109
19.794	0.988
21.089	1.176
22.902	1.431
25.037	1.324
27.893	1.686
29.231	1.592
39.775	1.902
42.132	2.063
42.901	2.224
45.086	1.808
59.781	2.654
61.666	2.453
65.843	2.829
77.723	3.058
79.280	3.259
100.702	3.435
105.142	3.824
109.940	3.624
114.636	4.066
118.318	4.228
128.050	4.644
133.380	4.430
133.513	5.261
143.906	4.846
149.371	5.450
151.293	5.021
159.664	5.666
167.019	6.042
171.023	5.841];
data.tWw_j(:,2) = data.tWw_j(:,2).^3; % remove transformation
units.tWw_j  = {'d', 'g'};  label.tWw_j = {'time since birth', 'wet weight', 'young in pouch'};  
temp.tWw_j  = C2K(36);  units.temp.tWw_j = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_j = 'Kean1975';
comment.tWw_j = 'Data for young in pouch';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;
weights.tL = 5 * weights.tL;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw','tWw_j'}; subtitle1 = {'Data for post weaning, in pouch'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7D574'; % Cat of Life
metaData.links.id_ITIS = '552696'; % ITIS
metaData.links.id_EoL = '323856'; % Ency of Life
metaData.links.id_Wiki = 'Trichosurus_vulpecula'; % Wikipedia
metaData.links.id_ADW = 'Trichosurus_vulpecula'; % ADW
metaData.links.id_Taxo = '60155'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800055'; % MSW3
metaData.links.id_AnAge = 'Trichosurus_vulpecula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trichosurus_vulpecula}}';
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
bibkey = 'Kean1975'; type = 'Article'; bib = [ ... 
'doi = {10.1080/03014223.1975.9517885}, ' ...
'author = {R. I. Kean}, ' ... 
'year = {1975}, ' ...
'title = {Growth of opossums (\emph{Trichosurus vulpecula}) in the {O}rongorongo {V}alley, {W}ellington, {N}ew {Z}ealand, 1953–61}, ' ...
'journal = {New Zealand Journal of Zoology}, ' ...
'volume = {2(4)}, ' ...
'pages = {435-444}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Trichosurus_vulpecula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

