function [data, auxData, metaData, txtData, weights] = mydata_Patagonotothen_guntheri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Patagonotothen_guntheri'; 
metaData.species_en = 'Yellowfin notothen'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.1); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman','Starrlight Augustine'};
metaData.date_subm  = [2019 02 12]; 
metaData.email      = {'bas.kooijman@vu.nl'}; 
metaData.address    = {'VU University Amsterdam'}; 

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 02 12]; 

%% set data
% zero-variate data

data.tp = 3.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'fishbase';   
  temp.tp = C2K(6.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ColliShree2008';   
  temp.am = C2K(6.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 10.2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = {'fishbase','ColliShree2008'}; 
  comment.Lp = 'based on 3-4 yr post birth (fishbase) and tL data (ColliShree2008)';
data.Li  = 23; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BricLapt2005';
  comment.Wwb = 'based egg diameter of 1.3 mm of Patagonotothen ramsayi: pi/6*0.13^3'; 
data.Wwp = 10.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00646*Lp^3.19, see F1';
data.Wwi = 143; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.19, see F1';

data.Ri  = 2e4/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'BricLapt2005';   
  temp.Ri = C2K(6.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Patagonotothen ramsayi at 23 cm';

% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), total length (cm)
2.985	8.708
2.985	8.892
2.985	9.334
3.041	9.887
3.987	10.555
4.005	11.476
4.042	10.960
4.988	12.476
4.988	12.586
4.988	12.881
5.007	11.518
6.008	13.770
6.991	16.133
7.009	15.322
7.028	14.733
7.028	15.101
8.011	15.880
8.011	16.433
9.012	16.880
9.012	17.138
9.995	17.327
9.995	17.806
9.995	18.211
10.977	18.621];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(6.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ColliShree2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 2 * weights.psd.kap;
%weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00646*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; benthopelagic; depth range 30 - 160 m. Temporate, preferred 6.1 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4DZHR'; % Cat of Life
metaData.links.id_ITIS = '642916'; % ITIS
metaData.links.id_EoL = '46572959'; % Ency of Life
metaData.links.id_Wiki = 'Patagonotothen_guntheri'; % Wikipedia
metaData.links.id_ADW = 'Patagonotothen_guntheri'; % ADW
metaData.links.id_Taxo = '183319'; % Taxonomicon
metaData.links.id_WoRMS = '234738'; % WoRMS
metaData.links.id_fishbase = 'Patagonotothen-guntheri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Patagonotothen}}';
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
bibkey = 'ColliShree2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2007.01711.x}, ' ...
'author = {M. A. Collins and R. S. Shreeve and S. Fielding and M. H. Thurston}, ' ... 
'year = {2008}, ' ...
'title = {Distribution, growth, diet and foraging behaviour of the yellow-fin notothen \emph{Patagonotothen guntheri} ({N}orman) on the {S}hag {R}ocks shelf ({S}outhern {O}cean)}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {72}, ' ...
'pages = {271-286}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BricLapt2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-005-0090-5}, ' ...
'author = {P. Brickle and V. Laptikhovsky and A. Arkhipkin and J. Portela}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive biology of \emph{Patagonotothen ramsayi} ({R}egan, 1913) ({P}isces: {N}ototheniidae) around the {F}alkland {I}slands}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {NA}, ' ...
'pages = {NA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Patagonotothen-guntheri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
