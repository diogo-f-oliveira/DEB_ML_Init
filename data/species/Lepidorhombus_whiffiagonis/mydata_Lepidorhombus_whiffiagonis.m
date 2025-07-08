function [data, auxData, metaData, txtData, weights] = mydata_Lepidorhombus_whiffiagonis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Scophthalmidae';
metaData.species    = 'Lepidorhombus_whiffiagonis'; 
metaData.species_en = 'Megrim'; 

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
metaData.date_subm = [2018 12 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.ab = 7;          units.ab = 'd'; label.ab = 'time since hatch at birth'; bibkey.ab = 'fishbase';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Actually fishbase specifies a temp of 0 C, but this is hard to belief';
data.am = 16 * 365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25.8;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.236e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm of : pi/6*0.1^3';
data.Wwp = 108;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00468*Lp^3.09, see F2';
data.Wwi = 1461;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.09, see F2';

data.Ri  = 640e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % ageclass (yr), total length (cm)
    0 9.53
    0 8.53
    1 19.69
    1 17.19
    2 25.56
    2 26.29
    3 28.03 
    3 29.48
    4 29.68
    4 32.89
    5 33.33
    5 33.29
    6 37.73];
data.tL_f(:,1) = (data.tL_f(:,1) + .75) * 365; % convert to time since birth (d)
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LandPifi1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % ageclass (yr), total length (cm)
0  9.52
0  7.73
1 19.10 
1 15.81
2 21.13
2 22.26
3 22.54
3 24.20
4 25.39
4 26.33
5 28.44];
data.tL_m(:,1) = (data.tL_m(:,1) + .75) * 365; % convert to time since birth (d)
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LandPifi1996';
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
F1 = 'left eyed';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight:  W in g = 0.00468*(TL in cm)^3.09';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6PBSM'; % Cat of Life
metaData.links.id_ITIS = '172835'; % ITIS
metaData.links.id_EoL = '46570241'; % Ency of Life
metaData.links.id_Wiki = 'Lepidorhombus_whiffiagonis'; % Wikipedia
metaData.links.id_ADW = 'Lepidorhombus_whiffiagonis'; % ADW
metaData.links.id_Taxo = '178404'; % Taxonomicon
metaData.links.id_WoRMS = '127146'; % WoRMS
metaData.links.id_fishbase = 'Lepidorhombus-whiffiagonis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidorhombus_whiffiagonis}}';
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
bibkey = 'LandPifi1996'; type = 'Article'; bib = [ ... 
'author = {J. Landa and C. Pifieiro and N. P\''{e}rez}, ' ... 
'year = {1996}, ' ...
'title = {Megrim (\emph{Lepidorhombus whiffiagonis}) growth patterns in the northeast {A}tlantic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {26}, ' ...
'pages = {279-294}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lepidorhombus-whiffiagonis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

