function [data, auxData, metaData, txtData, weights] = mydata_Knipowitschia_panizzae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Knipowitschia_panizzae'; 
metaData.species_en = 'Adriatic dwarf goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.8); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 06];

%% set data
% zero-variate data

data.ab = 8.5;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.45;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'KevrKokki1990'; 
data.Li  = 4.11;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'KevrKokki1990';
data.Lim  = 2.91;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'KevrKokki1990';

data.Wwb = 2.05e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.7-1.0 mm, width 0.65-0.8 mm for Potamoschistur microps: pi/6*0.08*0.07^2';
data.Wwp = 0.03;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.05, see F1';
data.Wwi = 0.624;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'KevrKokki1990';
  comment.Wwi = 'based on 0.00977*Li^3.05, see F1, gives 0.73 g';
data.Wwim = 0.169;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'KevrKokki1990';


% uni-variate data
% time-length
data.tL = [... %  time sice 1 May 1983 (yr), total length (cm)
60.305	1.412
89.772	1.604
118.553	1.785
148.706	2.022
180.228	2.046
209.695	2.047
240.533	2.004
271.371	2.095];
data.tL(:,1) = 30+data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KevrKokki1990'; 
comment.tL = 'T= 3.4 C(Dec. 1983) to 26.9 C (Jul. 1983): T(t) = 15+11.7*sin(2*pi*(t-330)/365)';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
2.096	70.093
2.100	65.582
2.198	67.036
2.209	74.044
2.212	69.033
2.221	91.072
2.250	59.494
2.323	96.031
2.407	87.472
2.425	178.145
2.617	217.627
2.944	178.886];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KevrKokki1990'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00977*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Eggs on unserside valve of Cerastoderma glaucum';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6NLSQ'; % Cat of Life
metaData.links.id_ITIS = '172140'; % ITIS
metaData.links.id_EoL = '46576383'; % Ency of Life
metaData.links.id_Wiki = 'Knipowitschia_panizzae'; % Wikipedia
metaData.links.id_ADW = 'Knipowitschia_panizzae'; % ADW
metaData.links.id_Taxo = '177771'; % Taxonomicon
metaData.links.id_WoRMS = '126901'; % WoRMS
metaData.links.id_fishbase = 'Knipowitschia-panizzae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Knipowitschia_panizzae}}';
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
bibkey = 'KevrKokki1990'; type = 'Article'; bib = [ ... 
'author = {T. Kevrekidis and A. K. Kokkinakis and A. Koukouras}, ' ... 
'year = {1990}, ' ...
'title = {Some aspects of the biology and ecology of \emph{Knipowitschia caucasica} ({T}eleostei: {G}obiidae) in the {E}vros {D}elta ({N}orth {A}egean {S}ea)}, ' ...
'journal = {Helgol\"{a}nder Meeresunters.}, ' ...
'volume = {44}, ' ...
'pages = {173-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Knipowitschia-panizzae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

