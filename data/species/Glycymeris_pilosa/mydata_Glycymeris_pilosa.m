function [data, auxData, metaData, txtData, weights] = mydata_Glycymeris_pilosa

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Arcida'; 
metaData.family     = 'Glycymerididae';
metaData.species    = 'Glycymeris_pilosa'; 
metaData.species_en = 'Hairy Bittersweet'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-dL'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 05]; 

%% set data
% zero-variate data

data.am = 69*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'PehaBlac2016';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'mean temparature is guessed';
  
data.Lj  = 0.1; units.Lj  = 'cm';  label.Lj  = 'shell length at metam'; bibkey.Lj  = 'guess';
data.Lp  = 4; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative shell length 2 cm compared to G. glycymeris: 2/7*3.5';
data.Li  = 8.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'PehaBlac2016';

data.Wwb = 5.8e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 55 mum: pi/9*0.0055^3'; 
data.Wwi = 181.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'PehaBlac2016';
  comment.Wwi = 'Weight probably includes shell';

data.Ri  = 1e5;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';

% uni-variate data

% time-length 
data.tL = [ ... % time since settlement (a), shell increment in a yr  (mum)
2.834	850.585
3.707	782.944
4.782	658.957
5.322	565.978
5.995	467.359
6.865	441.972
7.808	306.723
8.343	301.067
8.812	267.246
10.017	247.479
10.889	185.472
11.357	193.904
12.293	179.782
12.828	174.126
13.364	165.654
14.300	162.799
14.768	148.696
16.173	143.006
16.842	126.078
17.511	126.051
18.246	128.838
18.246	128.838
19.049	120.355
19.784	125.959
21.055	109.007
22.192	106.144
23.261	108.918
24.598	108.864
25.669	100.370
26.872	97.505
28.343	91.812
30.215	97.370
31.619	88.863
32.689	88.820
34.294	91.572
34.896	83.097
36.166	88.680
37.303	80.184
38.171	97.050
38.974	80.116
39.910	77.262
41.047	85.667
41.849	74.367
42.451	77.160
43.721	88.376
44.390	82.715
45.126	68.601
46.194	88.277
47.264	85.417
48.401	82.554
48.869	74.084
50.140	74.033
51.076	71.179
52.279	68.313
53.148	73.912
54.152	65.421
55.021	68.203
55.956	76.616
56.759	76.584
57.628	68.098
58.297	68.071
59.634	68.017
60.369	67.988
61.172	67.956
61.907	67.926
63.111	65.061
64.381	56.559
64.982	76.253];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/1e4; % convert mum in a yr to cm in a yr
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell height increment in a yr'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PehaBlac2016';
comment.tL = 'Data from Pasman Channel in the middle Adriatic Sea';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% discussion
D1 = 'Temperatures are guessed';
D2 = 'I had to include an offset for yearly length increments of 82 mum in tL data to arrive at a good fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3GFGT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46466108'; % Ency of Life
metaData.links.id_Wiki = 'Glycymeris'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39143'; % Taxonomicon
metaData.links.id_WoRMS = '156105'; % WoRMS
metaData.links.id_molluscabase = '156105'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PehaBlac2016'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.marenvres.2016.05.022}, ' ...
'author = {Melita Peharda and Bryan A. Black and Ariadna Purroy and Hrvoje Mihanovi\''{c}}, ' ... 
'year = {2016}, ' ...
'title = {The bivalve \emph{Glycymeris pilosa} as a multidecadal environmental archive for the {A}driatic and {M}editerranean {S}eas}, ' ...
'journal = {Marine Environmental Research}, ' ...
'volume = {119}, ' ...
'pages = {79-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Glycymeris-pilosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

