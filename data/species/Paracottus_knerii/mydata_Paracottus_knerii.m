function [data, auxData, metaData, txtData, weights] = mydata_Paracottus_knerii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottocomephoridae';
metaData.species    = 'Paracottus_knerii'; 
metaData.species_en = 'Stone sculpin'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 24];


%% set data
% zero-variate data

data.am = 7 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'TolmBogd2010';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'TolmBogd2010';
  comment.Lp = 'based on tp = 3 yr, from tL_f data';
data.Li  = 19;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm of Cottus volki: pi/6*0.163^3';
 
data.Ri = 600/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';       bibkey.Ri = 'fishbase';
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_B = [ ... % age (years), total length (cm) 
    1  3.07
    2  5.33
    3  7.10
    4  8.70
    5 10.45
    6 11.84];
data.tL_B(:,1) = 365 * (0.5 + data.tL_B(:,1)); % convert yr to d
units.tL_B = {'d', 'cm'}; label.tL_B = {'time since birth', 'total length', 'Southern Baikal'};  
temp.tL_B = C2K(7);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'TolmBogd2010';
comment.tL_B = 'data for Southern Baikal, 1994-2004';
%
data.tL_A = [ ... % age (years), total length (cm) 
    1  3.47
    2  5.42
    3  6.95
    4  8.52
    5 10.03
    6 11.60];
data.tL_A(:,1) = 365 * (0.5 + data.tL_A(:,1)); % convert yr to d
units.tL_A = {'d', 'cm'}; label.tL_A = {'time since birth', 'total length', 'Angara'};  
temp.tL_A = C2K(7);  units.temp.tL_A = 'K'; label.temp.tL_A = 'temperature';
bibkey.tL_A = 'TolmBogd2010';
comment.tL_A = 'data for the Angara, 1994-1995';
%
data.tL_S = [ ... % age (years), total length (cm) 
    1  4.16
    2  5.08
    3  6.09
    4  7.21
    5  8.09
    6  9.10];
data.tL_S(:,1) = 365 * (0.5 + data.tL_S(:,1)); % convert yr to d
units.tL_S = {'d', 'cm'}; label.tL_S = {'time since birth', 'total length', 'Sobolinoe Lake'};  
temp.tL_S = C2K(7);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'TolmBogd2010';
comment.tL_S = 'data for Sobolinoe Lake, 1994-1999';

% time-weight
data.tW_B = [ ... % age (years), wet weight (g)
    1  0.3
    2  2.0
    3  4.9
    4  9.2
    5 14.9
    6 19.7];
data.tW_B(:,1) = 365 * (0.5 + data.tW_B(:,1)); % convert yr to d
units.tW_B = {'d', 'g'}; label.tW_B = {'time since birth', 'wet weight', 'Southern Baikal'};  
temp.tW_B = C2K(7);  units.temp.tW_B = 'K'; label.temp.tW_B = 'temperature';
bibkey.tW_B = 'TolmBogd2010';
comment.tW_B = 'data for for Southern Baikal, 1994-2004, temp between 3 to 11 C';
%
data.tW_A = [ ... % age (years), wet weight (g)
    1  0.4
    2  1.8
    3  4.4
    4  8.3
    5 15.3
    6 20.2];
data.tW_A(:,1) = 365 * (0.5 + data.tW_A(:,1)); % convert yr to d
units.tW_A = {'d', 'g'}; label.tW_A = {'time since birth', 'wet weight', 'Angara'};  
temp.tW_A = C2K(8.8);  units.temp.tW_A = 'K'; label.temp.tW_A = 'temperature';
bibkey.tW_A = 'TolmBogd2010';
comment.tW_A = 'data for the Angara, 1994-1995, temp between 5.3 to 12.4 C';
%
data.tW_S = [ ... % age (years), wet weight (g)
    1  0.4
    2  1.3
    3  2.2
    4  3.8
    5  5.9
    6  8.6];
data.tW_S(:,1) = 365 * (0.5 + data.tW_S(:,1)); % convert yr to d
units.tW_S = {'d', 'g'}; label.tW_S = {'time since birth', 'wet weight', 'Sobolinoe Lake'};  
temp.tW_S = C2K(13);  units.temp.tW_S = 'K'; label.temp.tW_S = 'temperature';
bibkey.tW_S = 'TolmBogd2010';
comment.tW_S = 'data for  Sobolinoe Lake, 1994-1999, temp between 9 to 17 C';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_A = weights.tL_A * 5;
weights.tL_B = weights.tL_B * 5;
weights.tL_S = weights.tL_S * 5;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_B','tL_A','tL_S'}; subtitle1 = {'Data for Southern Baikal, Angara, Sobolinoe Lake'};
set2 = {'tW_B','tW_A','tW_S'}; subtitle2 = {'Data for Southern Baikal, Angara, Sobolinoe Lake'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females my {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6TNC8'; % Cat of Life
metaData.links.id_ITIS = '644225'; % ITIS
metaData.links.id_EoL = '216614'; % Ency of Life
metaData.links.id_Wiki = 'Paracottus_knerii'; % Wikipedia
metaData.links.id_ADW = 'Paracottus_knerii'; % ADW
metaData.links.id_Taxo = '182732'; % Taxonomicon
metaData.links.id_WoRMS = '1020417'; % WoRMS
metaData.links.id_fishbase = 'Paracottus-knerii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paracottus_knerii}}';
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
bibkey = 'TolmBogd2010'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945210070040}, ' ...
'author = {Yu. P. Tolmacheva and B. E. Bogdanov}, ' ... 
'year = {2010}, ' ...
'title = {Special Traits of Growth and Feeding of the Stone Sculpin \emph{Paracottus knerii} ({C}ottidae) in Water Bodies of Different Types}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {50}, ' ...
'pages = {529-535}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Paracottus-knerii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

