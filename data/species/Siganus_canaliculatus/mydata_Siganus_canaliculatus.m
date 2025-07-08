function [data, auxData, metaData, txtData, weights] = mydata_Siganus_canaliculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_canaliculatus'; 
metaData.species_en = 'White-spotted spinefoot'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 23];

%% set data
% zero-variate data

data.am = 3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MetaSada2019';
  comment.Wwb = 'based on assumed egg diameter of 0.7 mm: pi/6*0.07^3'; 
data.Wwp = 21; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^2.98, see F1';
data.Wwi = 840; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^2.98, see F1';

data.Ri  = 1e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MetaSada2019';   
  temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.016	9.437
0.299	14.485
0.524	18.674
0.768	22.862
1.056	26.302
1.421	28.456
1.766	28.895
2.124	29.548
2.508	30.094
2.879	30.318
3.313	30.223
3.620	30.338];
data.tL(:,1) = 365*(0.3+data.tL(:,1));  % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LatuAffa2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01413*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YMSC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46577146'; % Ency of Life
metaData.links.id_Wiki = 'Siganus_canaliculatus'; % Wikipedia
metaData.links.id_ADW = 'Siganus_canaliculatus'; % ADW
metaData.links.id_Taxo = '187593'; % Taxonomicon
metaData.links.id_WoRMS = '219687'; % WoRMS
metaData.links.id_fishbase = 'Siganus-canaliculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siganus_canaliculatus}}';
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
bibkey = 'MetaSada2019'; type = 'Article'; bib = [ ... 
'author = {S.Y.Metar and V.R.Sadawarte  and V.H.Nirmale and N.D.Chogale and A.N.Sawant and S.B.Satam}, ' ... 
'year = {2019}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF RABBIT FISH, \emph{Siganus canaliculatus} ({P}ARK, 1797) ALONG THE {R}ATNAGIRI COAST OF {M}AHARASHTRA}, ' ...
'journal = {J. Indian Fish. Assoc.}, ' ...
'volume = {46(2)}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LatuAffa2020'; type = 'Article'; bib = [ ... 
'author = {Husain Latuconsina and Ridwan Affandi and M. Mukhlis Kamal and Nurlisa A. Butet}, ' ... 
'year = {2020}, ' ...
'title = {On the assessment of white-spotted rabbitfish (\emph{Siganus canaliculatus} {P}ark, 1797) stock in the {I}nner {A}mbon {B}ay, {I}ndonesia}, ' ...
'journal = {AACL Bioflux}, ' ...
'volume = {13(4)}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/Siganus-canaliculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
