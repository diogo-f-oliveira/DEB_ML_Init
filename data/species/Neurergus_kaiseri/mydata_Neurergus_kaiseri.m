function [data, auxData, metaData, txtData, weights] = mydata_Neurergus_kaiseri 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Neurergus_kaiseri'; 
metaData.species_en = 'Kaiser''s Spotted Newt'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp % 
metaData.data_0     = {'ab';'aj';'ap'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wwj'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2018 08 14];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromsoe Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 10 03]; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

% a lot of the data are from ambient temperatures which depend
% on the season. We use a standard temp of 15 deg C
T_assumed = 15; 

data.ab = mean([2;3]) * 7;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'FaraShar2016';   
  temp.ab = C2K(T_assumed);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = ' range is 2-3 weeks';
  data.tj = mean([6;8]) * 30.5;    units.tj = 'd';    label.tj = 'time since birth at metamorphosis';           bibkey.tj = 'FaraShar2016';
  temp.tj = C2K(T_assumed);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
comment.tj = 'range: 6-8 months';
data.tp = 4*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'FaraShar2016';
  temp.tp = C2K(T_assumed);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
comment.tp  = 'range: 3-4 years';
  data.am = 12 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'FaraShar2016';   
  temp.am = C2K(T_assumed);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
comment.am = 'females';
   data.am_m = 14 * 365;    units.am_m = 'd';    label.am_m = 'life span';                bibkey.am_m = 'FaraShar2016';   
  temp.am_m = C2K(T_assumed);  units.temp.am_m = 'K'; label.temp.am_m = 'temperature'; 
comment.am_m = 'males';
 
data.Lb  = 14.94e-1;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'guess';  
comment.Lb = ' Value reported for N. microspilotus in SharVais2014 that was reported with a range of: 13.08 to 14.94 mm';
data.Lj  = 31e-1;   units.Lj  = 'cm';  label.Lj  = 'length at metamorphosis';   bibkey.Lj  = 'FaraShar2016';  
comment.Lj = 'range: 31 plus or minus 0.58 mm';

data.Li  = 7.5;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'FaraShar2016';
comment.Li = 'max female length from fig. 5';
data.Li_m  = 5.5;   units.Li_m  = 'cm';  label.Li_m  = 'ultimate SVL';   bibkey.Li_m  = 'FaraShar2016';
comment.Li_m = 'max males length from fig. 5';
data.Wwj = 1.5;   units.Wwj = 'g';   label.Wwj = 'wet weight at metamorphosis';     bibkey.Wwj = 'FaraShar2016';
comment.Wwj = '1.54 plus or minus 0.05 g';

data.Ri  = 150/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'FaraShar2016';   
temp.Ri = C2K(T_assumed);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'can produce over 100 eggs' ;

% uni-variate data
% time-length
data.tL_f = [ ... time since birth (yr) , SVL (mm)
0.342	21.129
0.342	24.306
0.370	26.706
0.643	29.176
0.643	30.447
0.643	31.647
0.657	33.129
3.969	55.788
3.969	57.059
3.969	57.694
4.981	59.247
4.981	60.306
5.980	62.424
5.980	66.588
6.008	68.071
6.993	59.318
6.993	60.165
7.007	65.388
7.021	70.753
6.993	72.306
8.020	59.529
8.006	62.918
8.020	64.753
8.006	69.271
7.978	70.259
7.978	71.176
8.991	61.647
9.005	63.553
9.005	73.718
10.004	63.765
11.017	60.447
10.989	61.294
10.989	63.553
11.003	64.612
11.003	66.235
11.017	68.141
12.016	62.353
12.002	68.353];  
data.tL_f(:,1) = data.tL_f(:,1) * 365; % year to day
data.tL_f(:,2) = data.tL_f(:,2)/ 10; % mm to cm
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f    = C2K(T_assumed);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FaraShar2016';
comment.tL_f = 'females';
%
data.tL_m = [ ... time since birth (yr), SVL (mm)
0.370	20.847
0.342	24.376
0.342	26.706
0.657	29.106
0.657	30.518
0.671	31.859
0.671	32.918
3.996	48.518
3.969	50.282
3.969	52.612
3.982	53.741
4.981	54.588
4.995	53.318
4.981	52.682
4.981	50.776
5.980	55.082
6.008	52.047
7.007	53.176
7.992	51.553
8.006	56.424
8.006	57.482
11.030	58.329
11.030	60.094
12.029	59.812
14.027	59.882]; 
data.tL_m(:,1) = data.tL_m(:,1) * 365; % year to day
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
data.tL_m(:,2) = data.tL_m(:,2)/ 10; % mm to cm
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m    = C2K(T_assumed);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FaraShar2016';
comment.tL_m = 'males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only.';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'The sex of each mature individual was determined according to sexual dimorphism reported for this species: males have a fleshy protuberance at the base of the tail,whereas females have a prominent cloaca but without the protuberance';
metaData.bibkey.F1 = 'FaraShar2016'; 
metaData.facts = struct('F1',F1);

%% Discussion points
D1 = 'The data are from ambient temperatures which depend on the season. We use a standard temp of 15 deg C ';
D2 = 'Males and females assumed to differ by {p_Am} only.';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '73YQ9'; % Cat of Life
metaData.links.id_ITIS = '1106315'; % ITIS
metaData.links.id_EoL = '330971'; % Ency of Life
metaData.links.id_Wiki = 'Neurergus_kaiseri'; % Wikipedia
metaData.links.id_ADW = 'Neurergus_kaiseri'; % ADW
metaData.links.id_Taxo = '149407'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Neurergus+kaiseri'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neurergus_kaiseri}}';
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
bibkey = 'FaraShar2016'; type = 'article'; bib = [ ... 
'author = {Hossein Farasat and Mozafar Sharifi}, ' ... 
'year = {2016}, ' ...
'title = {Ageing and Growth of the Endangered {K}aiser''s Mountain Newt, \emph{Neurergus kaiseri} ({C}audata: {S}alamandridae), in the {S}outhern {Z}agros {R}ange, Iran}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {50}, ' ...
'number = {1}, ' ...
'doi = {10.1670/14-142}, ' ...
'pages = {120-125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SharVais2014'; type = 'article'; bib = [ ... 
'author = {Mozafar Sharifi and Somaye Vaissi}, ' ... 
'year = {2014}, ' ...
'title = {Captive breeding and trial reintroduction of the Endangered yellow-spotted mountain newt \emph{Neurergus microspilotus} in {W}estern {I}ran}, ' ...
'journal = {Endangered Species Research}, ' ...
'volume = {23}, ' ...
'doi = {10.3354/esr00552}, ' ...
'pages = {159-166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
