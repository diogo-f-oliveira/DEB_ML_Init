function [data, auxData, metaData, txtData, weights] = mydata_Eretmochelys_imbricata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Cheloniidae';
metaData.species    = 'Eretmochelys_imbricata'; 
metaData.species_en = 'Hawksbill sea turtle'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCis', 'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 30];

%% set data
% zero-variate data

data.ab = 60;     units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'Wiki';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '60-95 d';
data.tp = 20*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';   
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 80*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'life span is unknown; ADW 30-50 yr, but uncertain';

data.Lb  = 4.2;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';         bibkey.Lb  = 'ADW'; 
  comment.Lb = 'Wiki: 2.3-3.5 cm';
data.Lp  = 83.8; units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'Witz1980';
  comment.Lp = 'Wiki gives 40 cm';
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'Wiki';

data.Wwb = 16.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
  comment.Wwb = '13.5-19.5 g; Wiki gives less than 24 g';
data.Wwi = 127000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';

data.Ri  = 50/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '140 eggs (wiki) laid in 3 clutches, 14 d apart, 1 spawn per 2 yr assumed; ADW: mating occurs each 2-3 yr';
 
% uni-variate data
% length-spec growth rate
data.tL = [ ... % time since birth (yr), carapace length (cm)
11.493	3.964
29.233	4.685
50.763	5.135
65.973	5.946
81.175	6.396
88.785	7.027
102.726	7.658
120.458	8.108
223.100	12.432
245.900	13.063
276.314	14.414
301.670	15.946
333.379	18.468
361.245	19.189
389.162	21.892
418.351	24.865
447.488	25.766
471.577	27.297
502.003	29.099
531.173	31.351
555.245	32.162
584.420	34.595
669.392	40.991
726.395	42.613
751.725	43.153
779.587	43.694
807.456	44.505
841.651	45.225
864.450	45.766
894.841	46.216];
%data.tL(1:13,:) = []; % Witz1980 excludes these measurements
units.tL  = {'cm', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL   = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Witz1980';
comment.tL = 'Data for captive turtles, reduced growth during the first yr';

% length-change in length
data.LdL = [ ... % curved carapace length (cm), change in length (cm/yr)
63.106	0.593
63.313	1.193
64.765	1.209
65.802	1.721
66.078	1.802
68.221	1.388
68.290	1.502
68.982	1.420
69.811	2.362
70.433	1.680
71.470	1.899
72.092	2.362
73.889	1.810
74.512	2.248
74.995	1.291
75.479	1.477
75.756	1.274
76.101	1.039
76.654	1.039
77.553	1.672
77.899	1.794
78.175	0.828
78.244	1.899
78.521	1.558
78.797	0.893
79.143	0.698
79.281	0.739
79.419	0.747
79.696	0.317
79.696	0.666
79.696	1.648
80.111	0.584
80.111	0.203
80.111	0.820
80.180	0.333
80.180	0.722
80.318	1.161
80.456	0.779
80.456	1.737
80.525	0.519
80.594	0.576
80.802	1.429
80.871	0.317
81.009	0.438
81.147	1.388
81.286	1.226
81.424	0.593
81.562	0.828
81.631	0.755
81.700	1.380
81.770	0.893
81.839	0.381
82.253	0.333
82.253	0.495
82.461	0.406
82.530	-0.089
82.599	-0.032
82.599	0.024
82.599	0.503
82.599	1.258
82.737	0.560
82.806	0.463
82.876	0.284
83.152	0.593
83.221	0.950
83.290	-0.024
83.359	0.885
83.429	0.698
83.498	0.162
83.498	0.097
83.636	0.422
83.705	0.227
83.912	0.114
83.912	0.065
83.912	0.008
84.396	-0.122
84.465	1.071
84.673	1.055
84.673	0.000
84.811	0.235
84.880	-0.089
85.088	0.909
85.295	0.722
85.502	-0.032
85.571	0.227
86.055	-0.179
86.055	0.130
86.124	0.130
86.194	0.787
86.332	-0.179
86.470	1.169
86.885	-0.138
86.954	-0.179
87.161	0.763
87.300	-0.268
87.922	0.463
88.959	0.114
89.304	1.266
89.512	-0.154
89.581	0.909
89.857	0.747
90.756	-0.114
91.931	0.284
93.106	0.519
93.313	-0.244
94.627	-0.146];
data.LdL(:,2) = data.LdL(:,2)/ 365; % convert cm/yr to cm/d
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'curved carapace length', 'chnage in curved carapace length'};  
temp.LdL   = C2K(18);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'BellPike1980';
comment.LdL = 'Data for turtles resident in northern Great Barrier Reef';
    
%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'tL data of Witz1980 was ignored, due to inconsistency with other data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'The hawksbill is biofluorescent, possibly because of its coral food, like Physogyra lichtensteini.';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GHZK'; % Cat of Life
metaData.links.id_ITIS = '173836'; % ITIS
metaData.links.id_EoL = '46559472'; % Ency of Life
metaData.links.id_Wiki = 'Eretmochelys_imbricata'; % Wikipedia
metaData.links.id_ADW = 'Eretmochelys_imbricata'; % ADW
metaData.links.id_Taxo = '48480'; % Taxonomicon
metaData.links.id_WoRMS = '137207'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Eretmochelys&species=imbricata'; % ReptileDB
metaData.links.id_AnAge = 'Eretmochelys_imbricata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eretmochelys_imbricata}}';
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
bibkey = 'Witz1980'; type = 'Article'; bib = [ ... 
'author = {W. N. Witzell}, ' ... 
'year = {1980}, ' ...
'title = {Growth of captive hawsbill turtles, \emph{Eretmochelys imbricata}, in western {S}amoa}, ' ...
'journal = {Bull. Mar. Sci.}, ' ...
'volume = {30(4)}, ' ...
'pages = {909-912}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BellPike1980'; type = 'Article'; bib = [ ... 
'author = {Ian Bell and David A. Pike}, ' ... 
'year = {1980}, ' ...
'title = {Somatic growth rates of hawksbill turtles \emph{Eretmochelys imbricata} in a northern {G}reat {B}arrier {R}eef foraging area}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {446}, ' ...
'pages = {275-283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Boul1994'; type = 'Article'; bib = [ ... 
'author = {Ralf H. Boulon}, ' ... 
'year = {1994}, ' ...
'title = {Growth Rates of Wild Juvenile Hawksbill Turtles, \emph{Eretmochelys imbricata}, in {S}t. {T}homas, {U}nited {S}tates {V}irgin {I}slands}, ' ...
'journal = {Copeia}, ' ...
'volume = {1994(3)}, ' ...
'pages = {811-814}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eretmochelys_imbricata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559472}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Eretmochelys_imbricata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

