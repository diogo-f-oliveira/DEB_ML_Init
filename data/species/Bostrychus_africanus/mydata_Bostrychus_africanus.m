function [data, auxData, metaData, txtData, weights] = mydata_Bostrychus_africanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Butidae';
metaData.species    = 'Bostrychus_africanus'; 
metaData.species_en = 'African Sleeper'; 

metaData.ecoCode.climate = {'Af','MA'};
metaData.ecoCode.ecozone = {'THp','MAE'};
metaData.ecoCode.habitat = {'0iMc', '0iFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Md'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 09];

%% set data
% zero-variate data

data.am = 3*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ChukGeor2016';   
  temp.am = C2K(26.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 10; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 21; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.8 mm : pi/6*0.18^3';
data.Wwp = 7.2;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00646*Lp^3.05, see F1';
data.Wwi = 70;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.05, see F1; fishbase gives 250 g';

data.Ri = 23479/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess'; 
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
 
% uni-variate data

% time-length
data.tL = [ ... % yr class (yr), std length (cm)
    0.0  7.0
    0.5 12.1
    1.0 15.0
    1.5 16.1
    2.0 17.0];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
units.tL  = {'d', 'cm'};  label.tL= {'time since birth', 'total length', 'female'};  
temp.tL   = C2K(26.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChukGeor2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo:SL =0.825*TL'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6V3SC'; % Cat of Life
metaData.links.id_ITIS = '637837'; % ITIS
metaData.links.id_EoL = '345056'; % Ency of Life
metaData.links.id_Wiki = 'Perccottus_glenii'; % Wikipedia
metaData.links.id_ADW = 'Perccottus_glenii'; % ADW
metaData.links.id_Taxo = '183455'; % Taxonomicon
metaData.links.id_WoRMS = '234083'; % WoRMS
metaData.links.id_fishbase = 'Perccottus-glenii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perccottus_glenii}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Perccottus-glenii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChukGeor2016'; type = 'article'; bib = [ ... 
'doi = {10.4314/jas.v31i2B.10}, ' ... 
'author = {Chukwu, K.O. and A.D.I. George}, ' ... 
'year = {2016}, ' ...
'title = {Growth and mortality of sleeper fish, \emph{Bostrychus africanus} from upper {N}ew {C}alabar river, {R}ivers {S}tate, {N}igeria}, ' ...
'journal = {Journal of Aquatic Sciences}, ' ...
'volume = {31(2B)}, ' ...
'pages = {425-432}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


