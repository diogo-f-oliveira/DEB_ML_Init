function [data, auxData, metaData, txtData, weights] = mydata_Excirolana_braziliensis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Isopoda'; 
metaData.family     = 'Cirolanidae';
metaData.species    = 'Excirolana_braziliensis'; 
metaData.species_en = 'Cirolanid Isopod'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 04]; 

%% set data
% zero-variate data

data.am = 2*365;    units.am = 'd';     label.am = 'life span';                         bibkey.am  = 'FonsVelo2000';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.1;   units.Lb  = 'cm';  label.Lb  = 'total length at birth for female';    bibkey.Lb  = 'FonsVelo2000';
data.Lp  = 0.69;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'FonsVelo2000';
data.Li  = 0.9;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female';   bibkey.Li  = 'FonsVelo2000';

data.Wwi = 32.8e-3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on same length-weight, compared to Asellus: 0.9^3*0.045';

data.Ri  = 4*27/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'FonsVelo2000';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '27 embryos per brood at TL 0.89 cm: 4 broods per yr guessed';
  
% uni-variate data
% t-L data
data.tL = [ ... % time at stage change (d), length (cm)
0.100	0.102
41.572	0.254
62.318	0.340
95.860	0.431
131.344	0.497
158.923	0.528
159+12.426	0.543
159+42.198	0.559
159+74.929	0.559
159+98.739	0.565
159+126.527	0.581
159+163.236	0.592
159+185.098	0.634
159+218.852	0.665
159+252.626	0.717
159+271.512	0.758
159+306.253	0.784
159+340.994	0.811
159+369.763	0.816];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FonsVelo2000';
comment.tL = 'Temperature oscillates between 20 and 34 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 8 * weights.tL;

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
D2 = 'Temperature in C for tL data varies with time in d as T(t)=27+7*sin(2*pi*(t+10)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3DJX6'; % Cat of Life
metaData.links.id_ITIS = '92255'; % ITIS
metaData.links.id_EoL = '1022976'; % Ency of Life
metaData.links.id_Wiki = 'Excirolana'; % Wikipedia
metaData.links.id_ADW = 'Excirolana_braziliensis'; % ADW
metaData.links.id_Taxo = '381139'; % Taxonomicon
metaData.links.id_WoRMS = '258413'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Excirolana}}';
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
bibkey = 'FonsVelo2000'; type = 'Article'; bib = [ ... 
'author = {Duane B. Fonseca and Val\''{e}ria G. Veloso and Ricardo S. Cardoso}, ' ... 
'year = {2000}, ' ...
'title = {GROWTH, MORTALITY, AND REPRODUCTION OF \emph{Excirolana braziliensis} {R}ICHARDSON, 1912 ({I}SOPODA, {C}IROLANIDAE) ON THE {P}RAINHA {B}EACH, {R}IO DE {J}ANEIRO, {B}RAZIL}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {73(5)}, ' ...
'pages = {535-545}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

