function [data, auxData, metaData, txtData, weights] = mydata_Tetrapturus_pfluegeri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Istiophoriformes'; 
metaData.family     = 'Istiophoridae';
metaData.species    = 'Tetrapturus_pfluegeri'; 
metaData.species_en = 'Longbill spearfish'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.2); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 03];

%% set data
% zero-variate data

data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(18.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Kajikia_audax';
data.ap = 2*365;  units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'PonsAroc2015';
  temp.ap = C2K(18.2);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'based on Lp and tL data';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(18.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Kajikia_audax';

data.Lp  = 150;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'PonsAroc2015'; 
data.Li  = 254;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 58000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight, based on 0.00447*Li^3.14, see F1, gives 159e3 g';

data.Ri  = 29e6/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 277 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Kajikia_audax';
 
% uni-variate data
% time-length
data.tL_fm = [ ...  % time since birth (yr), fork length (cm)
    1 131 133
    2 157 160
    3 164 167 
    4 167 171
    5 173 173
    6 184 178
    7 180 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.8)*365; % convert yr to f
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm    = C2K(18.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PonsAroc2015'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm; 
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Birth is here assumed to coincide with hatch due to lack of data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '55RY8'; % Cat of Life
metaData.links.id_ITIS = '172502'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Tetrapturus_pfluegeri'; % Wikipedia
metaData.links.id_ADW = 'Tetrapturus_pfluegeri'; % ADW
metaData.links.id_Taxo = '188920'; % Taxonomicon
metaData.links.id_WoRMS = '126954'; % WoRMS
metaData.links.id_fishbase = 'Tetrapturus-pfluegeri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tetrapturus_pfluegeri}}';
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
bibkey = 'PonsAroc2015'; type = 'Article'; bib = [ ... 
'author = {Maite Pons and Freddy Arocha and Andr\''{e}s Domingo and David J. Die and Alejandro Brazeiro and Fabio Hazin}, ' ... 
'year = {2015}, ' ...
'title = {ESTIMATION OF AGE AND GROWTH OF THE LONGBILL SPEARFISH (\emph{Tetrapturus pfluegeri}) IN THE {W}ESTERN {A}TLANTIC {O}CEAN}, ' ...
'journal = {Collect. Vol. Sci. Pap. ICCAT}, ' ...
'volume = {71(5)}, ' ...
'pages = {2262-2276}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Tetrapturus_pfluegeri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Tetrapturus-pfluegeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

