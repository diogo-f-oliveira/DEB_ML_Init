  function [data, auxData, metaData, txtData, weights] = mydata_Toxabramis_swinhonis
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Toxabramis_swinhonis'; 
metaData.species_en = 'Thin sharpbelly'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 16]; 

%% set data
% zero-variate data
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'DongGren2019'; 
data.Li = 12;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 3.9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'DongGren2019','fishbase'};
  comment.Wwp = 'based on 0.00617*Lp^3.03, see F1';
data.Wwi = 11.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00617*Li^3.03, see F1';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
206.396	5.499
232.619	6.285
261.379	6.756
296.060	7.502
328.204	7.737
364.577	8.207
423.789	8.519
461.854	9.186
498.227	9.342];
data.tL(:,1) = 40 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'YeMore2014'};

% length-fecundity
data.LN = [ ... % total length (cm)
7.516	191.039
8.741	705.547
8.798	302.113
8.945	773.361
8.965	517.807
9.225	491.602
9.243	585.821
9.300	384.179
9.430	478.700
9.448	599.825
9.708	694.694
9.727	506.405
9.839	372.177
10.080	493.902
10.153	803.517
10.173	399.983
10.208	1220.704
10.209	803.667
10.341	346.622
10.542	1517.566
10.917	348.172
10.971	1020.962
11.003	2568.135
11.083	590.772
11.119	1155.890
11.138	913.790
11.288	416.437
11.438	255.403
11.604	403.834
11.716	552.114
11.919	969.702
11.920	418.137
12.106	633.882
12.271	1374.236
12.307	1576.128
12.441	473.348
12.850	487.901
12.863	2021.571
13.586	2897.953
13.710	4687.526
14.314	1850.585
14.739	2672.356
14.820	6318.316
14.832	2605.342
14.916	5403.776
14.981	2484.667
15.017	2780.729
15.126	3803.442
15.164	3480.675
15.231	5754.399
15.236	4261.137
15.296	2916.007
15.399	5647.226
15.431	7113.682
15.449	7342.430
15.481	3010.677
15.496	4342.554
15.535	3589.297
15.590	3845.051
15.649	2849.694
15.662	4665.872
15.703	3441.767
15.842	6442.142
15.864	5419.779
15.914	1384.038
15.967	2258.620
15.968	1841.584
16.018	3577.145
16.054	4021.188
16.058	2918.058
16.155	7384.688
16.209	1963.309
16.267	7331.177
16.301	2461.313
16.312	4748.339
16.322	1694.553
16.324	6968.102
16.413	2098.387
16.502	3511.181
16.530	6282.559
16.630	4278.341
16.686	4076.699
16.692	2112.590
16.814	4736.236
16.815	4440.275
16.842	1709.406
16.856	3108.547
16.918	7306.022
17.152	3580.196
17.182	5867.272
17.186	4804.501
17.195	1616.187
17.283	3217.320
17.395	3298.337
18.293	7202.100];
units.LN = {'cm','#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = {'DongGren2019'};
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 50;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00617*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.86*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '57L9G'; % Cat of Life
metaData.links.id_ITIS = '690211'; % ITIS
metaData.links.id_EoL = '210170'; % Ency of Life
metaData.links.id_Wiki = 'Toxabramis_swinhonis'; % Wikipedia
metaData.links.id_ADW = 'Toxabramis_swinhonis'; % ADW
metaData.links.id_Taxo = '189180'; % Taxonomicon
metaData.links.id_WoRMS = '1014770'; % WoRMS
metaData.links.id_fishbase = 'Toxabramis-swinhonis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Toxabramis_swinhonis}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Toxabramis-swinhonis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YeMore2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12405}, ' ...
'author = {S. Ye and J. Moreau and W. Zeng and T. Zhang and J. Liu and Z. Li}, ' ... 
'year = {2014}, ' ...
'title = {Growth and mortality of two small ﬁshes, \emph{Toxabramis swinhonis} {G}unther, 1873 and \emph{Hyporhamphus intermedius} ({C}antor, 1842), in a {Y}angtze shallow lake ({C}hina) assessed by length frequency analysis}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {30}, ' ...
'pages = {479–484}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DongGren2019'; type = 'Article'; bib = [ ... 
'doi = {10.1051/limn/2019007}, ' ...
'author = {Xianghong Dong and Ga\"{e}l Grenouillet and Tao Ju and Tao Xiang and Zhan Mai and Pascal Laffaille and Sovan Lek and Jiashou Liu}, ' ... 
'year = {2019}, ' ...
'title = {Reproductive biology of thin sharpbelly, \emph{Toxabramis swinhonis} {G}\"{u}nther, 1873 in a shallow lake ({B}iandantang {L}ake) along the middle reach of the {Y}angtze {R}iver basin ({C}hina): implications for fisheries management}, ' ...
'journal = {Ann. Limnol.- Int. J. Lim. ,55 55, 8}, ' ...
'volume = {2019}, ' ...
'pages = {1-9}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

