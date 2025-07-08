function [data, auxData, metaData, txtData, weights] = mydata_Lepidorhombus_boscii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Scophthalmidae';
metaData.species    = 'Lepidorhombus_boscii'; 
metaData.species_en = 'Four-spot megrim'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.ab = 7;          units.ab = 'd'; label.ab = 'time since hatch at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16 * 365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Sant1995'; 
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.236e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm of Lepidorhombus_whiffiagonis: pi/6*0.1^3';
data.Wwp = 49.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00457*Li^3.1, see F1';
data.Wwi = 423;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*Li^3.1, see F1';

data.Ri  = 119e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % ageclass (yr), total length (cm)
0.786	6.275
0.786	7.015
0.867	7.905
0.867	8.497
1.056	8.499
1.679	14.428
1.679	15.020
1.815	12.505
1.869	14.430
2.790	18.290
2.790	19.030
2.817	20.215
2.844	21.103
3.549	19.040
3.684	21.558
3.738	20.078
3.792	21.559
3.847	22.892
3.874	20.080
4.226	22.157
4.470	23.344
4.632	23.346
4.795	25.124
4.930	24.238
5.201	24.981
5.336	24.539
5.634	25.430
5.661	26.171
5.851	26.913
6.203	27.510
6.880	28.702];
data.tL_f(:,1) = (data.tL_f(:,1) + .75) * 365; % convert to time since birth (d)
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end;
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LandPere2002';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % ageclass (yr), total length (cm)
0.547	7.105
0.711	6.661
0.738	8.438
0.793	7.549
0.820	7.105
1.640	14.359
1.749	15.099
1.777	15.839
1.831	14.063
1.913	14.211
2.651	17.615
2.733	19.391
2.733	19.984
2.761	20.576
2.788	17.911
3.663	20.576
3.745	20.724
3.854	21.612
3.882	23.092
4.729	25.757
4.784	23.092
4.838	25.016
5.740	24.572
6.752	27.533];
data.tL_m(:,1) = (data.tL_m(:,1) + .75) * 365; % convert to time since birth (d)
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end;
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LandPere2002';
comment.tL_m = 'Data for males';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'};  subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight:  W in g = 0.00457*(TL in cm)^3.1';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PBSP'; % Cat of Life
metaData.links.id_ITIS = '172834'; % ITIS
metaData.links.id_EoL = '46570240'; % Ency of Life
metaData.links.id_Wiki = 'Lepidorhombus_boscii'; % Wikipedia
metaData.links.id_ADW = 'Lepidorhombus_boscii'; % ADW
metaData.links.id_Taxo = '178403'; % Taxonomicon
metaData.links.id_WoRMS = '127145'; % WoRMS
metaData.links.id_fishbase = 'Lepidorhombus-boscii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidorhombus_boscii}}';
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
bibkey = 'LandPere2002'; type = 'Article'; bib = [ ... 
'author = {J. Landa and N. P\''{e}rez and C. Pifieiro}, ' ... 
'year = {2002}, ' ...
'title = {Growth patterns of the four spot megrim (\emph{Lepidorhombus boscii}) in the northeast {A}tlantic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {55}, ' ...
'pages = {141-152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sant1995'; type = 'techreport'; bib = [ ... 
'author = {Santos, P.}, ' ... 
'year = {1995}, ' ...
'title = {Growth, mortality and maturation of \emph{Lepidorhombus boscii} in {P}ortuguese waters}, ' ...
'institution = {ICES Demersal Fish Committee, C.M.}, ' ...
'volume = {1995/G:38}, ' ...
'pages = {20pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lepidorhombus-boscii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

