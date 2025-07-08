  function [data, auxData, metaData, txtData, weights] = mydata_Taenioides_cirratus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Taenioides_cirratus'; 
metaData.species_en = 'Bearded worm goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mpb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 10];

%% set data
% zero-variate data
data.am = 4 * 365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'LianFang2020';   
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on remark that life span is short';
 
data.Lp = 12.6;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';           bibkey.Lp = 'LianFang2020'; 
data.Li = 36.2;    units.Li = 'cm'; label.Li = 'ultimate standard length';           bibkey.Li = 'SiddRahm2020';
 
data.Wwb = 4.77e-5;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LianFang2020';
  comment.Wwb = 'based on egg diameter of 0.45 mm: pi/6*0.045^3';
data.Wwi = 52.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'SiddRahm2020';
 
data.GSI = 0.075; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'LianFang2020';
  temp.GSI = C2K(28.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'fecundity ';

% univariate data

% time-length
data.tL_fm = [ ... % time (month), total length (cm)
    1 10.21 10.67
    2 14.82 15.33
    3 17.85 18.34];
data.tL_fm(:,1) = 365 * (0.3 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(28.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1 {'females','males'}}; 
bibkey.tL_fm = 'LianFang2020';

% length-weight-fecundity
data.LWF = [ ... % total length (cm), weight (g), fecundity (#)
    13.3  5.2  967
    18.9 18.6 5114];
units.LWF = {'cm', 'g', '#'}; label.LWF = {'total length','weight','fecundity'};  
treat.LWF = {1 {'total length','weight','fecundity'}}; 
bibkey.LWF = 'LianFang2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

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
F1 = 'length-weight Ww in g =  2.62e-3*(TL in cm)^3.001';
metaData.bibkey.F1 = 'LianFang2020'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54H7F'; % Cat of Life
metaData.links.id_ITIS = '638117'; % ITIS
metaData.links.id_EoL = '46575130'; % Ency of Life
metaData.links.id_Wiki = 'Taenioides_cirratus'; % Wikipedia
metaData.links.id_ADW = 'Taenioides_cirratus'; % ADW
metaData.links.id_Taxo = '188754'; % Taxonomicon
metaData.links.id_WoRMS = '277223'; % WoRMS
metaData.links.id_fishbase = 'Taenioides-cirratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Taenioides_cirratus}}';  
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
bibkey = 'LianFang2020'; type = 'article'; bib = [ ...  
'doi = {10.1111/jai.14024}, ' ...
'author = {Yangyang Liang and Ting Fang and Jing Li and Kun Yang and Xiuxia Zhao and Kai Cuiand Wenxuan Lu}, ' ...
'year = {2020}, ' ...
'title = {Age, growth and reproductive traits of invasive goby \emph{Taenioides cirratus} in the {C}haohu {L}ake, {C}hina}, ' ... 
'journal = {J Appl Ichthyol.}, ' ...
'volume = {00}, ' ...
'number = {1–8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SiddRahm2020'; type = 'article'; bib = [ ...  
'doi = {0.1007/s41208-020-00254-4}, ' ...
'author = {Mohammad Abdul Momin Siddique and Mahfuzur Rahman and Najmus Sakib Khan and Md. Mohidul Islam}, ' ...
'year = {2020}, ' ...
'title = {Size Frequency, Length-Weight, and Length-Length Relationship of Bearded Worm Goby \emph{Taenioides cirratus} ({B}lyth, 1860) from the {N}oakhali {C}oast, {B}ay of {B}engal}, ' ... 
'journal = {Thalassas: An International Journal of Marine Sciences}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Taenioides-cirratus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
