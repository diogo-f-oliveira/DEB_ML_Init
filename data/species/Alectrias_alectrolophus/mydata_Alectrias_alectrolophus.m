function [data, auxData, metaData, txtData, weights] = mydata_Alectrias_alectrolophus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Stichaeidae';
metaData.species    = 'Alectrias_alectrolophus'; 
metaData.species_en = 'Stone cockscomb'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2019 03 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 27];

%% set data
% zero-variate data

data.am = 7*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'KolpMilo2014';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 13;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'KolpMilo2014';
  
data.Wwb = 2.6e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';

data.Ri  = 80/365; units.Ri  = '#/d'; label.Ri  = 'max reprod ratecm';    bibkey.Ri  = 'KolpMiro2007';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length data
data.tL_OB = [ ... % time since birth (yr), total length (cm)
3.019	5.250
3.602	7.375
4.208	8.225
4.806	9.200
5.403	9.750
5.995	10.550];
data.tL_OB(:,1) = 365 * data.tL_OB(:,1); % convert yr 
units.tL_OB  = {'d', 'cm'};  label.tL_OB = {'time since birth', 'total length', 'Olga Bay, Sea of Japan'};  
temp.tL_OB   = C2K(15);  units.temp.tL_OB = 'K'; label.temp.tL_OB = 'temperature';
bibkey.tL_OB = 'KolpMilo2014';
comment.tL_OB = 'data for Olga Bay, Sea of Japan';
%
data.tL_SO = [ ... % time since birth (yr), total length (cm)
3.019	5.050
3.023	5.200
3.607	7.575
3.607	7.425
4.208	8.475
4.208	8.700
4.806	10.075
4.806	10.625
5.393	11.250
5.393	11.750
5.995	11.775
5.995	12.775];
data.tL_SO(:,1) = 365 * data.tL_SO(:,1); % convert yr 
units.tL_SO  = {'d', 'cm'};  label.tL_SO = {'time since birth', 'total length', 'Sea of Okhotsk'};  
temp.tL_SO   = C2K(15);  units.temp.tL_SO = 'K'; label.temp.tL_SO = 'temperature';
bibkey.tL_SO = 'KolpMilo2014';
comment.tL_SO = 'inlet of the Sea of Okhotsk';
% 
data.tW_SO = [ ... % time since birth (yr), wet weight (g)
3.028	0.486
3.028	0.681
3.616	1.524
3.617	2.011
4.200	3.341
4.214	3.146
4.789	5.805
4.789	6.389
5.387	8.303
5.388	9.081
5.967	10.281
5.976	11.059];
data.tW_SO(:,1) = 365 * data.tW_SO(:,1); % convert yr 
units.tW_SO  = {'d', 'g'};  label.tW_SO = {'time since birth', 'wet weight', 'Sea of Okhotsk'};  
temp.tW_SO   = C2K(15);  units.temp.tW_SO = 'K'; label.temp.tW_SO = 'temperature';
bibkey.tW_SO = 'KolpMilo2014';
comment.tW_SO = 'inlet of the Sea of Okhotsk';
%
data.tW_OB = [ ... % time since birth (yr), wet weight (g)
3.024	0.551
3.612	1.622
4.209	2.205
4.793	2.757
5.385	3.535
5.974	3.989];
data.tW_OB(:,1) = 365 * data.tW_OB(:,1); % convert yr 
units.tW_OB  = {'d', 'g'};  label.tW_OB = {'time since birth', 'wet weight', 'Olga Bay, Sea of Japan'};  
temp.tW_OB   = C2K(15);  units.temp.tW_OB = 'K'; label.temp.tW_OB = 'temperature';
bibkey.tW_OB = 'KolpMilo2014';
comment.tW_OB = 'data for Olga Bay, Sea of Japan';

% length-weight data
data.LW_OB = [ ... % total length (cm), wet weight (g)
3.979	0.285
5.074	0.446
5.128	0.477
5.479	0.541
5.745	0.526
5.851	0.855
6.319	1.247
6.947	1.562
7.106	1.797
7.255	1.704
7.255	1.423
7.362	1.611
7.426	1.205
7.596	1.346
7.638	1.737
7.638	1.877
7.670	2.003
7.681	1.628
7.681	2.253
7.702	1.487
7.734	2.065
7.830	2.066
7.862	1.738
7.872	2.363
7.936	2.113
7.979	1.629
8.064	1.488
8.064	2.676
8.096	1.692
8.128	2.239
8.128	2.176
8.234	1.802
8.287	2.396
8.362	2.333
8.426	2.927
8.436	2.006
8.479	1.693
8.500	1.834
8.564	2.897
8.617	2.397
8.755	2.710
8.872	2.398
9.138	3.290
9.277	2.665
9.277	2.243
9.585	3.244
9.617	2.932
9.926	3.855
10.574	3.998];
units.LW_OB  = {'cm', 'g'};  label.LW_OB = {'total length', 'wet weight', 'Olga Bay, Sea of Japan'};  
bibkey.LW_OB = 'KolpMilo2014';
comment.LW_OB = 'data for Olga Bay, Sea of Japan';
%
data.LW_SO = [ ... % total length (cm), wet weight (g)
3.851	0.222
5.000	0.508
5.532	0.900
5.968	1.012
6.213	1.184
6.755	1.515
6.798	2.109
6.904	1.390
7.489	2.096
8.574	3.240
8.734	3.241
8.798	3.663
9.404	4.431
9.574	4.635
10.574	6.358
10.628	7.249];
units.LW_SO  = {'cm', 'g'};  label.LW_SO = {'total length', 'wet weight', 'Sea of Okhotsk'};  
bibkey.LW_SO = 'KolpMilo2014';
comment.LW_SO = 'inlet of the Sea of Okhotsk';

%% set weights for all real data
weights = setweights(data, []);
%weights.tL_OB = 5 * weights.tL_OB;
%weights.tL_SO = 5 * weights.tL_SO;
weights.LW_OB = 5 * weights.LW_OB;
weights.LW_SO = 5 * weights.LW_SO;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_SO','tL_OB'}; subtitle1 = {'Data for Sea of Okhotsk, Japan'};
set2 = {'tW_SO','tW_OB'}; subtitle2 = {'Data for Sea of Okhotsk, Japan'};
set3 = {'LW_SO','LW_OB'}; subtitle3 = {'Data for Sea of Okhotsk, Japan'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Temperature is max in July-Aug, 27C, ice during mid-Nov,, end Feb';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'BM42'; % Cat of Life
metaData.links.id_ITIS = '171605'; % ITIS
metaData.links.id_EoL = '46574626'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Alectrias_alectrolophus'; % ADW
metaData.links.id_Taxo = '160326'; % Taxonomicon
metaData.links.id_WoRMS = '279547'; % WoRMS
metaData.links.id_fishbase = 'Alectrias-alectrolophus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stichaeidae}}';
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
bibkey = 'KolpMilo2014'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945214030084}, ' ...
'author = {E. V. Kolpakov and P. G. Milovankin}, ' ... 
'year = {2014}, ' ...
'title = {Size-Age Structure, Growth, and Feeding of Stone Cockscomb \emph{Alectrias alectrolophus} ({P}isces: {S}tichaeidae) from {O}lga {B}ay of the {S}ea of {J}apan}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {54}, ' ...
'pages = {372-376}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KolpMiro2007'; type = 'Article'; bib = [ ... 
'doi = {10.1134/s0032945207020075}, ' ...
'author = {Kolpakov, E. V. and Miroshnik, V. V.}, ' ... 
'year = {2007}, ' ...
'title = {Stone cockscomb \emph{Alectrias alectrolophus} ({S}tichaedae) -- a new representative of cold-water ichthyofauna in the waters of northern {P}rimorskii {K}rai}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {47}, ' ...
'pages = {194-197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alectrias-alectrolophus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
