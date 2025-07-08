function [data, auxData, metaData, txtData, weights] = mydata_Gymnogeophagus_lacustris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Gymnogeophagus_lacustris'; 
metaData.species_en = 'Eartheater'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TP','TH','TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};  
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 02];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 14.6;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'VerbLamp2011';
  comment.Wwb = 'based on egg diameter of 1.7-2.6 mm : pi/6*0.25^3';
data.Wwp = 8.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02512*Lp^3.00, see F1';
data.Wwi = 78.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwim = 'based on 0.02512*Li^3.00, see F1';

data.Ri  = 3*253/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'HartPere1999';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Spawning frequency is assumed three times per yr';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time (yr), total length (cm)
1.530	7.275
1.777	7.707
2.025	8.033
2.283	8.253
2.531	8.153
2.778	8.638
3.048	8.752
3.273	8.917
3.532	9.775
3.791	9.569
4.038	9.895
4.252	10.858
4.792	11.192
5.039	10.932
5.534	12.541];
data.tL_f(:,1) = 365 * (0.2+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time','total length','females'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HartBrus1998';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time (yr), total length (cm)
1.406	7.485
1.710	9.035
1.946	9.892
2.160	11.547
2.452	12.193
2.688	12.465
2.936	12.578
3.161	12.744
3.420	13.602
3.690	14.354
3.937	14.467
4.173	14.526
4.657	15.550
4.916	16.195
5.399	17.112
5.669	18.236
6.175	17.984];
data.tL_m(:,1) = 365 * (0.2+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time','total length','males'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HartBrus1998';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.02512*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HS34'; % Cat of Life
metaData.links.id_ITIS = '648482'; % ITIS
metaData.links.id_EoL = '214839'; % Ency of Life
metaData.links.id_Wiki = 'Gymnogeophagus'; % Wikipedia
metaData.links.id_ADW = 'Gymnogeophagus_lacustris'; % ADW
metaData.links.id_Taxo = '46084'; % Taxonomicon
metaData.links.id_WoRMS = '218777'; % WoRMS
metaData.links.id_fishbase = 'Gymnogeophagus-lacustris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnogeophagus}}';
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
bibkey = 'HartBrus1998'; type = 'Article'; bib = [ ... 
'author = {Sandra Maria Hartz and Willi Bruschi-Junior and M\''{a}rcio Vanini Formehl}, ' ... 
'year = {1998}, ' ...
'title = {Idade e crescimento de \emph{Gymnogeophagus lacustris} {R}eis \& {M}alabarba, um {C}ichlidae end\''{e}mico de bacia hidrogr\''{a}fica do {R}io {T}ramanda\''{i}, {R}io {G}rande do {S}ul, {B}razil}, ' ...
'journal = {Revta bras.Zool.}, ' ...
'volume = {15(3)}, ' ...
'pages = {605-612}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VerbLamp2011'; type = 'Article'; bib = [ ... 
'author = {J\''{u}lia T. Verba and Vinicius R. Lampert and Marco A. Azevedo}, ' ... 
'year = {2011}, ' ...
'title = {Reproductive traits of \emph{Gymnogeophagus labiatus} ({T}eleostei, {C}ichlidae), in an upper stretch of {S}inos river, {C}ara\''{a}, {B}razil}, ' ...
'journal = {Iheringia, S\''{e}rie Zoologia, Porto Alegre}, ' ...
'volume = {101(3)}, ' ...
'pages = {200-206}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HartPere1999'; type = 'Article'; bib = [ ... 
'author = {Hartz, S. M. and Peret, A. C. and Barbieri, G.}, ' ... 
'year = {1999}, ' ...
'title = {Reproduction of \emph{Gymnogeophagus lacustris} ({R}eis \& {M}alabarba, 1988), an endemic {N}eotropical cichlid of {S}outhern {B}razil}, ' ...
'journal = {Ichthyological Exploration of Freshwaters}, ' ...
'volume = {10}, ' ...
'pages = {247-253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnogeophagus-lacustris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

