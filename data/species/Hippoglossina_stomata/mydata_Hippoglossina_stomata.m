function [data, auxData, metaData, txtData, weights] = mydata_Hippoglossina_stomata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Hippoglossina_stomata'; 
metaData.species_en = 'Bigmouth flounder'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 18];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(17.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16.2;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'MartOrte2001'; 
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.75 mm of Citharichthys_sordidus: pi/6*0.075^3';
data.Wwp = 48.5;  units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';      bibkey.Wwp = {'fishbase','MartOrte2001'};
  comment.Wwp = 'based on 0.00912*Lp^3.08, see F1';
data.Wwi = 784;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.08, see F1';
 
data.Ri = 22e3/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'guess';
  temp.Ri = C2K(17.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Citharichthys sordidus';

% uni-variate data
% time-length
data.tL_fm = [... % time since birth (yr), std length (cm)
 1	10.832  9.359
 2	15.278 13.361
 3	18.912 16.701
 4	21.884 19.084
 5	24.487 21.392
 6	26.502 23.112
 7	28.001 24.463
 8	29.645 25.961
 9	30.996 26.796
10	31.611 27.485]; 
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.8) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'age', 'std length'};  
temp.tL_fm = C2K(17.1); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MartOrte2001'; treat.tL_fm = {1, {'females','males'}};

% time-weight
data.tW_fm = [... % time since birth (yr), weight (g)
 1	 20.968  19.355
 2	 54.839  35.484
 3	108.065  69.355
 4	174.194  95.161
 5	245.161 122.581
 6	319.355 146.774
 7	387.097 167.742
 8	456.452 188.710
 9	516.129 206.452
10	564.516 225.806];
data.tW_fm(:,1) = (data.tW_fm(:,1) + 0.8) * 365; % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'age', 'weight'};  
temp.tW_fm = C2K(17.1); units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'MartOrte2001'; treat.tW_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwp = 0 * weights.Wwp;
weights.Lp = 3 * weights.Lp;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for females, males in Southern California'};
% set2 = {'tL_fC','tL_mC'}; subtitle2 = {'Data for females, males in Central California'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'I had to add 4 yrs for age estimates to arrive at a plausible fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00912*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3M256'; % Cat of Life
metaData.links.id_ITIS = '172784'; % ITIS
metaData.links.id_EoL = '46570525'; % Ency of Life
metaData.links.id_Wiki = 'Hippoglossina'; % Wikipedia
metaData.links.id_ADW = 'Hippoglossina_stomata'; % ADW
metaData.links.id_Taxo = '176719'; % Taxonomicon
metaData.links.id_WoRMS = '275827'; % WoRMS
metaData.links.id_fishbase = 'Hippoglossina-stomata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippoglossina}}';
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
bibkey = 'MartOrte2001'; type = 'article'; bib = [ ...
'author = {Marco A. Mart\''{i}nez-Mu\~{n}oz and A. A. Ortega-Salas}, ' ...
'year = {2001}, ' ...
'title = {GROWTH AND MORTALITY OF THE BIGMOUTH SOLE, \emph{Hippoglossina stomata} {E}IGENMANN \& {E}IGENMANN 1890 ({P}ISCES: {P}ARALICHTHYIDAE), OFF THE WESTERN COAST OF {B}AJA {C}ALIFORNIA, {M}EXICO}, ' ... 
'journal = {BULLETIN OF MARINE SCIENCE}, ' ...
'volume = {69(3)}, ' ...
'pages = {1109–1119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Hippoglossina_-stomata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

