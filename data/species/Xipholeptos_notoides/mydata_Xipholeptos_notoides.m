function [data, auxData, metaData, txtData, weights] = mydata_Xipholeptos_notoides

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Idiosepida'; 
metaData.family     = 'Idiosepiidae';
metaData.species    = 'Xipholeptos_notoides'; 
metaData.species_en = 'Southern pygmy squid'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 22];

%% set data
% zero-variate data

data.am = 115;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'TracStee2003';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.amm = 91;   units.amm = 'd';    label.amm = 'life span for males';       bibkey.amm = 'TracStee2003';   
  temp.amm = C2K(17);  units.temp.amm = 'K'; label.temp.amm = 'temperature'; 

data.Lp  = 1.4;  units.Lp  = 'cm';  label.Lp  = 'dorsal mantle length at puberty'; bibkey.Lp  = 'TracStee2003';
data.Lpm  = 0.68;  units.Lpm  = 'cm';  label.Lpm  = 'dorsal mantle length at puberty for male'; bibkey.Lpm  = 'TracStee2003';
data.Li  = 2.0;  units.Li  = 'cm';  label.Li  = 'dorsal mantle length at death';   bibkey.Li  = 'TracStee2003';
data.Lim  = 1.6;  units.Lim  = 'cm';  label.Lim  = 'dorsal mantle length at death for male';   bibkey.Lim  = 'TracStee2003';

data.Wwb = 1.72e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LewiChoat1993';
  comment.Wwb = 'value for Idiosepius_pygmaeus';
data.Wwi = 0.817; units.Wwi = 'g';   label.Wwi = 'wet weight at death';     bibkey.Wwi = 'TracStee2003';
  comment.Wwi = 'based on length-weight 0.883e-3*(10*Li)^2.28; TracStee2003 give 398 mg as max weight, but that is probably an error';
data.Wwim = 0.298; units.Wwim = 'g';   label.Wwim = 'wet weight at death for males';     bibkey.Wwim = 'TracStee2003';

data.Ni  = 389;  units.Ni  = '#';   label.Ni  = 'cum reprod at death';             bibkey.Ni  = 'LewiChoat1993';   
  temp.Ni = C2K(17);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on size-corrected value for Idiosepius_pygmaeus: 640*398/655';
 
% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (mg)
62.946	0.037
72.899	0.079
73.603	0.191
77.302	0.060
80.983	0.348
81.497	0.126
85.124	0.174
87.808	0.551
92.973	0.407
93.033	0.172
94.852	0.218
96.604	0.474
96.908	0.318
98.843	0.381
99.190	0.415
105.787	0.607
114.733	0.696];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(17);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'TracStee2003';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (mg)
58.991	0.033
69.387	0.039
70.565	0.249
78.795	0.166
78.998	0.067
79.017	0.149
79.042	0.261
80.285	0.261
82.749	0.166
87.623	0.231
89.194	0.185
89.970	0.117
90.073	0.073
91.697	0.261
92.244	0.180];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(17);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'TracStee2003';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
% weights.tWw_f = 5 * weights.tWw_f;
% weights.tWw_m = 5 * weights.tWw_m;
% weights.Lpm = 3 * weights.Lpm;
%weights.Wwi = 3 * weights.Wwi;
%weights.Wwim = 3 * weights.Wwim;
weights.am = 10 * weights.am;
%weights.amm = 3 * weights.amm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 3 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hp and h_a only';
D2 = 'mod_1: males equal to females upto b';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Death is programmed, not by ageing; reprod once just before death';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5CFLW'; % Cat of Life
metaData.links.id_ITIS = '556052'; % ITIS
metaData.links.id_EoL = '52572812'; % Ency of Life
metaData.links.id_Wiki = 'Xipholeptos_notoides'; % Wikipedia
metaData.links.id_ADW = 'Idiosepius_notoides'; % ADW
metaData.links.id_Taxo = '5738281'; % Taxonomicon
metaData.links.id_WoRMS = '1055555'; % WoRMS
metaData.links.id_molluscabase = '1055555'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xipholepto}}';
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
bibkey = 'TracStee2003'; type = 'Article'; bib = [ ... 
'author = {Sean R. Tracey and Mike A. Steer and Gretta T. Pecl}, ' ... 
'year = {2003}, ' ...
'title = {Life history traits of the temperate mini-maximalist \emph{Idiosepius notoides}, ({C}ephalopoda: {S}epioidea)}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {83}, ' ...
'pages = {1297-1300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LewiChoat1993'; type = 'Article'; bib = [ ... 
'author = {Andrew R. Lewis and j. Howard Choat}, ' ... 
'year = {1993}, ' ...
'title = {Spawning and Reproductive Output of the Tropical cephalopod \emph{Idiosepius pygmaeus}}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {50}, ' ...
'pages = {20--28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

