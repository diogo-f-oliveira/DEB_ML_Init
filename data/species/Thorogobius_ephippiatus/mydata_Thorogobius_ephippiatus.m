function [data, auxData, metaData, txtData, weights] = mydata_Thorogobius_ephippiatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Thorogobius_ephippiatus'; 
metaData.species_en = 'Leopard-spotted goby';

metaData.ecoCode.climate = {'MC','MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 20];

%% set data
% zero-variate data

data.am = 9*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(11.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Lim  = 13;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length';     bibkey.Lim  = 'fishbase';

data.Wwb = 8.5e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 2 mm and width of 0.9 mm : pi/6*0.2*0.09^2';
data.Wwp = 1.9;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00724*Li^3.10, see F1';
data.Wwi = 20.6;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.10, see F1';

data.Ri  = 12000/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(11.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [... %  age (yr), std length (cm)
1	2.918 3.308
2.	4.195 4.864
3	5.668 6.198
4	6.639 7.754
5	7.860 9.199
6	8.776 9.306
7	8.019 NaN];
data.tL_fm(:,1) = 365 * (0+data.tL_fm(:,1)); 
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm    = C2K(11.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Dunn1976'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
    6.3 5793
    6.3 5368
    6.3 7134
    6.1 2532
    6.5 5333
    6.7 2998
    7.1 7613
    7.4 5539
    7.4 6415
    7.5 6415
    8.1 7964
    8.8 12056];
units.LN   = {'cm', '#'};  label.LN = {'std length','fecundity'};  
temp.LN    = C2K(11.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Dunn1976'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0;
weights.tL_fm = 10 * weights.tL_fm;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00724*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56KVS'; % Cat of Life
metaData.links.id_ITIS = '172043'; % ITIS
metaData.links.id_EoL = '46575234'; % Ency of Life
metaData.links.id_Wiki = 'Thorogobius_ephippiatus'; % Wikipedia
metaData.links.id_ADW = 'Thorogobius_ephippiatus'; % ADW
metaData.links.id_Taxo = '188999'; % Taxonomicon
metaData.links.id_WoRMS = '126937'; % WoRMS
metaData.links.id_fishbase = 'Thorogobius-ephippiatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thorogobius_ephippiatus}}';
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
bibkey = 'Dunn1976'; type = 'Article'; bib = [ ... 
'author = {James Dunne}, ' ... 
'year = {1976}, ' ...
'title = {Littoral and Benthic Investigations on the West Coast of Ireland: {V} (Section {A}: Faunistic and Ecological Studies). {A} Contribution to the Biology of the Leopardspotted Goby, \emph{Thorogobius ephippiatus} ({L}owe) ({P}isces: {T}eleostei: {G}obiidae)}, ' ...
'journal = {Proceedings of the Royal Irish Academy. Section {B}: {B}iological, Geological, and Chemical Science}, ' ...
'volume = {76}, ' ...
'pages = {121-132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Thorogobius-ephippiatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
