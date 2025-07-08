function [data, auxData, metaData, txtData, weights] = mydata_Ilisha_pristigastroides

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Ilisha_pristigastroides'; 
metaData.species_en = 'Javan ilisha'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf','biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L','L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 13];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 3*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'BlabStau1998';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'BlabStau1998';
data.Li = 30;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 6.5e-3; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'BlabStau1998';
  comment.Wwb = 'based on egg diameter of 2.32 mm: pi/6*0.232^3';
data.Wwp = 114; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BlabStau1998','fishbase'};
  comment.Wwp = 'based on 0.00871*(Lp/0.84)^3.04, see F1';
data.Wwi = 458; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*(Li/0.84)^3.04, see F1';
  
data.GSI = 0.11; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'BlabStau1998';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
91.950	4.651
111.106	5.620
114.729	8.527
114.818	7.364
129.994	10.078
134.138	6.202
141.652	8.527
145.662	6.395
149.120	11.434
157.096	7.752
168.068	15.116
168.113	14.535
179.487	16.667
190.966	17.442
191.115	15.504
198.703	16.860
206.559	14.729
214.043	17.442
225.507	18.411
237.388	13.953
244.618	19.961
248.390	20.930
267.501	22.481
275.209	22.287
275.343	20.543
290.474	23.837
294.544	20.930
302.326	19.767
305.933	22.868
317.293	25.194
317.695	19.961
332.648	25.581
332.707	24.806
348.315	21.899
367.203	26.357
386.300	28.101
401.431	31.395
401.714	27.713
413.208	28.295
443.813	30.426
447.376	34.109
447.466	32.946
451.386	31.977
466.577	34.496
474.463	31.977
489.833	32.171
501.312	32.946
539.714	33.721
547.138	37.209
566.547	34.884
570.558	32.752
593.515	34.302
600.909	38.178
608.810	35.465
616.562	34.690
643.396	35.853
674.061	37.209
908.140	44.186];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BlabStau1998';

% length-fecundity
data.LN = [ ... % std length (cm), weight (g)
20.215	8278.821
21.663	2781.560
21.691	34781.941
21.703	48851.075
21.813	16025.006
22.433	12723.213
22.778	11072.793
25.796	60493.738
26.178	22154.181
27.419	16929.921
27.560	19138.753
28.810	24949.107
29.986	24413.604
31.383	39329.424
32.138	31615.694
32.147	42374.443
32.428	47619.703
32.489	37413.640
32.624	33277.568
32.910	44040.136
32.975	39075.514
33.547	60324.783
33.659	30257.368
33.978	79365.220
34.019	45986.466
34.081	38263.190
34.369	51232.681
34.453	67509.691
34.720	56203.030
35.133	54553.565
35.344	57590.948];
units.LN = {'cm', '#'};  label.LN = {'std length', 'fecundity'}; 
bibkey.LN = 'BlabStau1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 10 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;
weights.GSI = 0 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'GSI is at odds with LN data, possibly due to water absorption by eggs';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3PG8P'; % Cat of Life
metaData.links.id_ITIS = '551319'; % ITIS
metaData.links.id_EoL = '46562735'; % Ency of Life
metaData.links.id_Wiki = 'Ilisha'; % Wikipedia
metaData.links.id_ADW = 'Ilisha_pristigastroides'; % ADW
metaData.links.id_Taxo = '177500'; % Taxonomicon
metaData.links.id_WoRMS = '281169'; % WoRMS
metaData.links.id_fishbase = 'Ilisha-pristigastroides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ilisha}}';  
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
bibkey = 'BlabStau1998'; type = 'Article'; bib = [ ...  
'doi = {10.1006/ecss.1998.0376}, ' ...
'author = {S.J.M. Blaber and J. Staunton-Smith and D.A. Milton and G. Fry and T. Van der Velde and J. Pang and P. Wong and Ong Boon-Teck}, ' ...
'year = {1998}, ' ...
'title = {The Biology and Life-history Strategies of \emph{Ilisha} ({T}eleostei: {P}ristigasteridae) in the Coastal Waters and Estuaries of {S}arawak}, ' ... 
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {47(4)}, ' ...
'pages = {499–511}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ilisha-pristigastroides.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
