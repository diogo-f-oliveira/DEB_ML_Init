function [data, auxData, metaData, txtData, weights] = mydata_Pomatoschistus_microps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Pomatoschistus_microps'; 
metaData.species_en = 'Common goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.8); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 26];

%% set data
% zero-variate data

data.ab = 8.5;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(10.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2.6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 9;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.05e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg length 0.7-1.0 mm, width 0.65-0.8 mm: pi/6*0.08*0.07^2';
data.Wwp = 0.23;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00776*Lp^3.08, see F1';
data.Wwi = 6.74;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.08, see F1';

data.Ri  = 1628/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... %  yr class (yr), total length (cm)
47.368	1.819
105.260	2.833
135.611	2.894
166.609	3.015
196.954	3.107
224.654	3.221
256.314	3.335
288.017	3.222
317.048	3.276
346.676	3.669
378.319	3.874];
data.tL(:,1) = 80+data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(10.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SouzDias2014'; 
comment.tL = 'data from Minho estuary (NW Iberian Peninsula)';

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
D1 = 'Males are assumed not to differ from females';
D2 = 'temperature T (C) in tL data is assumed to vary as T(t)=15+10*sin(pi*2*(t-t_T)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00776*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQXJ'; % Cat of Life
metaData.links.id_ITIS = '171982'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pomatoschistus_microps'; % Wikipedia
metaData.links.id_ADW = 'Pomatoschistus_microps'; % ADW
metaData.links.id_Taxo = '46608'; % Taxonomicon
metaData.links.id_WoRMS = '126927'; % WoRMS
metaData.links.id_fishbase = 'Pomatoschistus-microps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomatoschistus_microps}}';
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
bibkey = 'SouzDias2014'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-013-0172-0}, ' ...
'author = {A. T. Souza and E. Dias and J. Campos and J. C. Marques and I. Martins}, ' ... 
'year = {2014}, ' ...
'title = {Structure, growth and production of a remarkably abundant population of the common goby, \emph{Pomatoschistus microps} ({A}ctinopterygii: {G}obiidae)}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {97}, ' ...
'pages = {701–715}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Pomatoschistus-microps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

