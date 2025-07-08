  function [data, auxData, metaData, txtData, weights] = mydata_Chitala_chitala

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Notopteridae';
metaData.species    = 'Chitala_chitala'; 
metaData.species_en = 'Indian featherback'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 01 05];                           
metaData.email    = {'Bas.Kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, the Boelelaan 1085, 1081 HV Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 05]; 

%% set data
% zero-variate data
data.ah = 188/24; units.ah = 'd';    label.ah = 'age at hatch';           bibkey.ah = 'SarkDeep2006'; 
  temp.ah = C2K(26);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = '168 to 192 h';
data.tb = 6;     units.tb = 'd';    label.tb = 'time since hatch at birth';  bibkey.tb = 'SarkDeep2006'; 
  temp.tb = C2K(26); units.temp.tb = 'K'; label.temp.tb = 'temperature'; 
data.am = 20*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 1.25;   units.Lb = 'cm';   label.Lb = 'total length at birth';bibkey.Lb = 'SarkDeep2006';
data.Lp = 75.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 122;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0477;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'SarkDeep2006';
  comment.Wwb = 'based on egg diameter of 4.5 mm: pi/6*0.45^3';
   
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm)
    1  481.96 
    2  593.1
    3  718.38
    4  932.32
    5 1040.63
    6 1073.63];
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'SarkNegi2008';
comment.tL = 'data from Bhagirathi, India';

% length-weight
data.LW = [ ... % log total length (cm), log wet weight (g)
2.603	2.610
2.613	2.709
2.620	2.706
2.624	2.670
2.629	2.706
2.639	2.765
2.644	2.706
2.649	2.749
2.663	2.833
2.769	3.175
2.796	3.203
2.824	3.322
2.833	3.354
2.834	3.338
2.881	3.438
2.887	3.497
2.892	3.339
2.918	3.656];
data.LW = exp(data.LW); % remove log-transformation
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW  = 'SarkNegi2008';
comment.LW = 'data from Bhagirathi, India';

% weight-fecundity
NW = [ ... log fecundity (#), log weight (g)
4.014	3.063
4.058	3.050
4.060	3.088
4.063	3.114
4.063	3.120
4.065	3.206
4.069	3.154
4.095	3.182
4.098	3.081
4.104	3.118
4.105	3.162
4.105	3.225
4.111	3.253
4.135	3.213
4.139	3.237
4.139	3.170
4.141	3.291
4.143	3.228
4.149	3.299
4.152	3.322
4.163	3.309
4.186	3.312
4.229	3.321
4.246	3.312
4.250	3.346
4.251	3.301];
data.WN = 10.^(NW(:,[2 1])); % remove log tansformation and reverse order of variables
units.WN   = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN    = C2K(27);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN  = 'HussShak2015';
comment.WN = 'data from Ravi, Pakistan';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Regional variations in length at puberty are substantial';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts 
F1 = 'Males guards eggs attached to (vertical) surfaces';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y68R'; % Cat of Life
metaData.links.id_ITIS = '649803'; % ITIS
metaData.links.id_EoL = '1004327'; % Ency of Life
metaData.links.id_Wiki = 'Chitala_chitala'; % Wikipedia
metaData.links.id_ADW = 'Chitala_chitala'; % ADW
metaData.links.id_Taxo = '170881'; % Taxonomicon
metaData.links.id_WoRMS = '1026796'; % WoRMS
metaData.links.id_fishbase = 'Chitala-chitala'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chitala_chitala}}';  
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
bibkey = 'SarkNegi2008'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10531-004-2935-6}, ' ...
'author = {U. K. Sarkar and R. S. Negi and P. K. Deepak and W. S. Lakra and S. K. Paul}, ' ... 
'year = {2008}, ' ...
'title = {Biological parameters of the endangered fish \emph{Chitala chitala} ({O}steoglossiformes: {N}otopteridae) from some {I}ndian rivers}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {90}, ' ...
'pages = {170-177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SarkDeep2006'; type = 'Article'; bib = [ ... 
'author = {Uttam Kumar Sarkar and Prashant Kumar Deepak and Raje Singh Negi and Shriprakash Singh and Dhurendra Kapoor}, ' ... 
'year = {2006}, ' ...
'title = {Captive breeding of endangered fish \emph{Chitala chitala} ({H}amilton-{B}uchanan) for species conservation and sustainable utilization}, ' ...
'journal = {Biodiversity \& Conservation}, ' ...
'volume = {15}, ' ...
'pages = {3579-3589}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HussShak2015'; type = 'Article'; bib = [ ... 
'author = {A. Hussain and H. A. Shakir and S. Ali and J. I. Qazi}, ' ... 
'year = {2015}, ' ...
'title = {GROWTH COEFFICIENT AND FECUNDITY OF \emph{Chitala chitala} ({O}steoglossiformes: {N}otopteridae) FROM THE {R}IVER {R}AVI, {P}AKISTAN}, ' ...
'journal = {The Journal of Animal \& Plant Sciences}, ' ...
'volume = {25}, ' ...
'pages = {401-405}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\urlhttp://www.fishbase.org/summary/Chitala-chitala.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 
