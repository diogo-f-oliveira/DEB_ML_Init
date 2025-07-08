function [data, auxData, metaData, txtData, weights] = mydata_Clinocottus_globiceps
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Clinocottus_globiceps'; 
metaData.species_en = 'Mosshead sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data

data.am = 8 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(10.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Clinocottus_analis';
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Clinocottus_analis';
data.Li  = 19;  units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwi = 134; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01023*Li^3.22, see F1'; 

data.Ri = 1e3/365; units.Ri = '#/d';   label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(10.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Clinocottus_analis';

% uni-variate data
% time-length
data.tL = [ ... % age (years), total length (cm) 
    0   2.73
    1   4.03
    2   5.42
    3   7.00
    4   8.04
    5   9.09];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mgay1995'; 
comment.tL = 'data from Helby Island';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'W6D8'; % Cat of Life
metaData.links.id_ITIS = '167226'; % ITIS
metaData.links.id_EoL = '46569088'; % Ency of Life
metaData.links.id_Wiki = 'Clinocottus_globiceps'; % Wikipedia
metaData.links.id_ADW = 'Clinocottus_globiceps'; % ADW
metaData.links.id_Taxo = '171442'; % Taxonomicon
metaData.links.id_WoRMS = '280221'; % WoRMS
metaData.links.id_fishbase = 'Clinocottus-globiceps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Clinocottus_globiceps}}';
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
bibkey = 'Mgay1995'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1439-0426.1995.tb00005.x}, ' ...
'author = {Mgaya, Y. D.}, ' ... 
'year = {1995}, ' ...
'title = {Age and growth analysis of the mosshead sculpin \emph{Clinocottus globiceps} {G}irard 1857 ({P}isces: {C}ottidae) from {H}elby {I}sland, {B}ritish {C}olumbia}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {11(1-2)}, ' ...
'pages = {50–59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clinocottus-globiceps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

