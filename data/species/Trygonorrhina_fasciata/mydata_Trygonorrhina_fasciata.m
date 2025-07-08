function [data, auxData, metaData, txtData, weights] = mydata_Trygonorrhina_fasciata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Rhinobatidae';
metaData.species    = 'Trygonorrhina_fasciata'; 
metaData.species_en = 'Eastern fiddler ray';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMcd','0iMm','0iFe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 04];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 11*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(20.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 26*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'IzzoGill2008';   
  temp.am = C2K(20.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 27;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'IzzoGill2008';
data.Lp  = 76.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'IzzoGill2008'; 
data.Lpm  = 67.5;   units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'IzzoGill2008'; 
  comment.Lpm = '65-70 cm';
data.Li  = 120;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 10e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'fishbase','IzzoGill2008'};
  comment.Wwi = 'based on 0.007*Li^2.96, see F1';

data.Ri  = 5.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'IzzoGill2008';   
  temp.Ri = C2K(20.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-7 pups per litter; assumed 1 litter per 1 yr';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	24.896
0.001	27.635
0.968	36.100
0.969	38.589
1.476	52.282
1.981	57.261
1.982	59.502
2.485	52.780
2.989	50.788
3.471	57.759
3.979	76.681
4.987	69.959
9.534	101.079
12.993	100.581
15.037	108.050];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
  temp.tL_f = C2K(20.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'IzzoGill2008';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	29.627
0.001	36.100
0.002	32.116
0.969	40.581
1.957	54.025
2.462	55.519
2.966	55.519
3.470	53.527
4.989	80.166
5.994	60.747
7.008	83.900
8.017	84.647
8.496	76.681
8.497	82.656
9.000	73.444
10.012	88.382
11.020	86.141];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
  temp.tL_m = C2K(20.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'IzzoGill2008';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 5 * weights.psd.v;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.007 * (TL in cm)^2.96';
metaData.bibkey.F1 = 'IzzoGill2008'; 
F2 = 'Ovoviviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '59F36'; % Cat of Life
metaData.links.id_ITIS = '564450'; % ITIS
metaData.links.id_EoL = '46560708'; % Ency of Life
metaData.links.id_Wiki = 'Trygonorrhina_fasciata'; % Wikipedia
metaData.links.id_ADW = 'Trygonorrhina_fasciata'; % ADW
metaData.links.id_Taxo = '189638'; % Taxonomicon
metaData.links.id_WoRMS = '283064'; % WoRMS
metaData.links.id_fishbase = 'Trygonorrhina-fasciata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trygonorrhina_fasciata}}'; 
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
bibkey = 'IzzoGill2008'; type = 'Article'; bib = [ ... 
'author = {Christopher Izzo and Browyn M. Gillanders}, ' ... 
'year = {2008}, ' ...
'title = {Initial assessment of age, growth and reproductive parameters of the southern fiddler ray \emph{Trygonorrhina fasciata} ({M}\"{u}ller \& {H}enle, 1841) from {S}outh {A}ustralia}, ' ...
'journal = {Pan-American Journal of Aquatic Sciences}, ' ...
'volume = {3(3)}, ' ...
'pages = {321-327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trygonorrhina-fasciata.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 