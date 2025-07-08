function [data, auxData, metaData, txtData, weights] = mydata_Sillago_flindersi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_flindersi'; 
metaData.species_en = 'Eastern school whiting';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 14];

%% set data
% zero-variate data

data.ab = 5.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(15.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'GrayBarn2014';   
  temp.am = C2K(15.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14.5; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 32;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.88 mm of Sillago robusta: pi/6*0.088^3';
data.Wwi = 355;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00851*Li^3.07, see F1';
 
data.Ri  = 2*110e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity 110e3 per spawning, 2 spawnings per yr';

% uni-variate data
% time-length data
data.tL_Yfm = [ ... % time since hatch (d), fork length (cm)
    0  5.70  5.70
    1 12.86 13.06
    2 16.94 17.22
    3 19.98 19.49
    4 21.33 20.66
    5 22.09 21.88
    6 24.50 NaN];
data.tL_Yfm(:,1) = (data.tL_Yfm(:,1) + .8) * 365;
units.tL_Yfm = {'d', 'cm'}; label.tL_Yfm = {'time since birth', 'fork length'};  
temp.tL_Yfm  = C2K(15.4); units.temp.tL_Yfm = 'K'; label.temp.tL_Yfm = 'temperature';
treat.tL_Yfm = {1 {'females','males'}}; label.treat.tL_Yfm = 'Yamba';
bibkey.tL_Yfm = 'GrayBarn2014';
%
data.tL_Nfm = [ ... % time since hatch (d), fork length (cm)
    0  6.91  6.91
    1 13.17 13.73
    2 17.50 17.20
    3 21.47 20.44
    4 23.85 21.93
    5 25.36 22.50];
data.tL_Nfm(:,1) = (data.tL_Nfm(:,1) + .8) * 365;
units.tL_Nfm = {'d', 'cm'}; label.tL_Nfm = {'time since birth', 'fork length'};  
temp.tL_Nfm  = C2K(15.4); units.temp.tL_Nfm = 'K'; label.temp.tL_Nfm = 'temperature';
treat.tL_Nfm = {1 {'females','males'}}; label.treat.tL_Nfm = 'Newcastle';
bibkey.tL_Nfm = 'GrayBarn2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Yfm = 3 * weights.tL_Yfm;
weights.tL_Nfm = 3 * weights.tL_Nfm;

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
D1 = 'males are assumed to differ for females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00851*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YQHN'; % Cat of Life
metaData.links.id_ITIS = '646043'; % ITIS
metaData.links.id_EoL = '46579897'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_flindersi'; % Wikipedia
metaData.links.id_ADW = 'Sillago_flindersi'; % ADW
metaData.links.id_Taxo = '187646'; % Taxonomicon
metaData.links.id_WoRMS = '273940'; % WoRMS
metaData.links.id_fishbase = 'Sillago-flindersi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_flindersi}}';
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
bibkey = 'GrayBarn2014'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-014-0793-z}, ' ...
'author = {Charles A. Gray and Lachlan M. Barnes and Faith A. Ochwada-Doyle and Dylan E. van der Meulen and Ben W. Kendall and William D. Robbins}, ' ... 
'year = {2014}, ' ...
'title = {Age, growth and demographic characteristics of \emph{Sillago flindersi} exploited in a multi-species trawl fishery}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {80}, ' ...
'pages = {915–924}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago-flindersi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
