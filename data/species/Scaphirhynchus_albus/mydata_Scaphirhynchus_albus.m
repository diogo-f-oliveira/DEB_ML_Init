function [data, auxData, metaData, txtData, weights] = mydata_Scaphirhynchus_albus

%% set metadata
metaData.phylum     = 'Chordata';            
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Scaphirhynchus_albus'; 
metaData.species_en = 'Pallid sturgeon'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa'}; % MT is 'BSk', KA & MO are 'Cfa', and ND, SD, NE, & IA are 'Dfa'
metaData.ecoCode.ecozone = {'THn'};  
metaData.ecoCode.habitat = {'0iFr'};              
metaData.ecoCode.embryo  = {'Fg', 'Fc'};
metaData.ecoCode.migrate = {'Mp'};                
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};                

metaData.T_typical  = C2K(13); % K, body temp  
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 't-L_f'; 't-Ww_f'};

metaData.COMPLETE = 4.0; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 22];                          
metaData.email     = {'sta@akvtplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'}; 

metaData.author_mod_1   = {'Bas Kooijman'};                             
metaData.date_mod_1     = [2023 04 01];                          
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University, Amsterdam'};  

metaData.author_mod_2   = {'Nicole Daigle'};                             
metaData.date_mod_2     = [2024 04 06];                          
metaData.email_mod_2    = {'Nicole.Daigle@unb.ca'};                 
metaData.address_mod_2  = {'University of New Brunswick, Canada'};  

metaData.curator     = {'Bas Kooijman'}; 
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 04 23]; 

%% set data
% % zero-variate data;

data.ab = 18.2; units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'Choj2022';   
  temp.ab = C2K(17.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';                   
data.tp = 15 * 365;  units.tp = 'd'; label.tp = 'age at puberty female'; bibkey.tp = {'Holm2018','Cox2022'};          
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'estimated by subtracting average age at reproductive readiness by spawning periodicity; see discussion point D2';
data.tp_m = 12 * 365;  units.tp_m = 'd'; label.tp_m = 'age at puberty male'; bibkey.tp_m = {'Holm2018','Cox2022'};   
  temp.tp_m = C2K(13); units.temp.tp_m = 'K'; label.temp.tp_m = 'temperature'; 
  comment.tp_m = 'estimated by subtracting average of age at reproductive readiness by spawning periodicity; see discussion point D2';
data.am = 100*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Hame2020';   
  temp.am = C2K(13);units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Temperature is the estimated yearly average of the Missouri River';

data.Li  = 163.8;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'Shum2006';
  comment.Li = 'The largest pallid sturgeon captured in sampling records and angler catches';

data.Wwb = 0.0239;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DeLo2016';
  comment.Wwb = 'Birth is interpreted as the beginning of exogenous feeding, which occurs at 13d post-hatch in pallid sturgeon - temp was 16.5C'; 
data.Wwi = 30e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'USFWS2019'; 
  comment.Wwi = 'The largest pallid sturgeon captured in sampling records';

data.Ri  = 170000/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reproduction rate';   bibkey.Ri  = 'Keen1992';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'Divided by 2 to account for 2 year spawning periodicity, max fecundity used from Keen1992';

% uni-variate data 
% length-weight
data.LW = [ ... % fork length (mm), wet weight (g)
794 1941   
864 2239
897 2948
990 3402
1096 6500
794 1941
893 2835
940 3266
1130 4990
1274 12247
1384 9979
1433 15422
1244 10433
1356 14515
1378 15000
1404 17100
1397 15700
1454 17700
1448 18000
1479 19051];
data.LW(:,1) = data.LW(:,1)/10; % convert mm to cm
units.LW = {'cm', 'g'};     label.LW = {'fork length', 'wet weight'};  bibkey.LW = 'KeenMax1993';
temp.LW = C2K(13);  units.temp.LW = 'K'; label.temp.LW = 'temperature'; 
comment.LW = 'see source for converting between SL, TL and FL lengths.';
  
% time-length
 data.tL_f = [ ... year, mm fork length
     7 601
     10 864
     11 705
     12 657
     12 910
     14 853
     17 865
     25 1274
     41 1404];
 data.tL_f(:,2) = data.tL_f(:,2)/ 10; % convert mm to cm
 data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
 units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'fork length','females'};  
 temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
 bibkey.tL_f = 'KeenJenk1993';
 comment.tL_f = 'females, temp is estimated';
% 
 data.tL_m = [ ... year, mm fork length
     8 640
     8 738
     9 710
     11 724
     37 1244];
data.tL_m(:,2) = data.tL_m(:,2)/ 10; % convert mm to cm
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'fork length','males'};  
bibkey.tL_m = 'KeenJenk1993';
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
comment.tL_m = 'males, temp is estimated';

% time-weight
 data.tWw_f = [ ... year, kg
      7  0.8
     10  2.2
     11  2.0
     12  1.2
     12  4.0
     14  3.9
     17  4.2
     25 12.2
     41 17.1];
data.tWw_f(:,2) = data.tWw_f(:,2) * 1e3; % convert kg to g
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % convert yr to d
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight','females'};  
temp.tWw_f = C2K(13);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'KeenJenk1993';
comment.tWw_f = 'females, temp is estimated';
% 
 data.tWw_m = [ ... year, kg
     8  1.2
     8  1.9
     9  1.7
    11  1.6
    37 10.4];
data.tWw_m(:,2) = data.tWw_m(:,2) * 1e3; % convert kg to g
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % convert yr to d
units.tWw_m = {'d', 'g'};     label.tWw_m = {'time since birth', 'wet weight'};  
temp.tWw_m = C2K(13);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'KeenJenk1993';  
comment.tWw_m = 'males, temp is estimated'; 
 
% start of growth (length and weight time series) for fish at 3 different feeding levels 
%   (f1 - fasted, f2 - med ration, f3 - high ration)
% all fish held at same temp and, until 15yo, all fish were reared in the same food conditions (assumed to be f=1 or close)

% averaged F1 datasets
% weight for f=0 (fasted) group 
data.tWw_f1 = [ 0 35 77 112 135 ; % F1 (fasted group) time in days 
                3205.5 3083.5 2989.4 2992.8 2929.5 ]'; % average body weight at each time point
temp.tWw_f1 = C2K(17.8);  units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature (K)'; % hatchery setting; temp is confident for all f1-f3 data
Ww0.tWw_f1 = 3205; units.Ww0.tWw_f1 = 'g'; label.Ww0.tWw_f1 = 'initial wet weight (g)'; % average initial wet weight of group
units.tWw_f1 = {'d', 'g'};  label.tWw_f1 = {'time', 'wet weight'};   
bibkey.tWw_f1 = 'Daig2023'; 
comment.tWw_f1 = 'this group was fasted for 4.5 months, beginning at day 0, f=0';

% fork length for f=0 (fasted) group 
data.tL_f1 = [ 0 35 77 112 135 ; % F1 (fasted group) time in days
               81.1 81.9 81.8 82.4 83.1 ]'; % average fork length at each time point 
temp.tL_f1 = C2K(17.8);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature (K)'; 
Lw0.tL_f1 = 81.1; units.Lw0.tL_f1 = 'cm'; label.Lw0.tL_f1 = 'initial fork length (cm)'; % average initial fork length of group
units.tL_f1 = {'d', 'cm'};  label.tL_f1 = {'time (d)', 'fork length (cm)'};   
bibkey.tL_f1 = 'Daig2023'; 
comment.tL_f1 = 'forklength acquired using conversion from KeenMax1993';
%
% averaged F2 datasets
% weight for f=X (medium ration) group 
data.tWw_f2 = [ 0 35 77 112 135 ; % F2 (medium group) time in days
                3222.4 3318.2 3306.7 3297.8 3281.5 ]'; % average body weight at each time point
temp.tWw_f2 = C2K(17.8);  units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature (K)'; 
Ww0.tWw_f2 = 3222.4; units.Ww0.tWw_f2 = 'g'; label.Ww0.tWw_f2 = 'initial wet weight (g)'; % average initial wet weight of group
units.tWw_f2 = {'d', 'g'};  label.tWw_f2 = {'time (d)', 'wet weight (g)'};   
bibkey.tWw_f2 = 'Daig2023'; comment.tWw_f2 = 'fed same ration for 4.5 months, beginning at day 0, f= MED'; 

% fork length for f=X (medium ration) group 
data.tL_f2 = [ 0 35 77 112 135 ; % F2 (medium group) time in days
               80.4 81.8 82.1 82.2 83.3 ]'; % average fork length at each time point 
temp.tL_f2 = C2K(17.8);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature (K)'; 
Lw0.tL_f2 = 80.4; units.Lw0.tL_f2 = 'cm'; label.Lw0.tL_f2 = 'initial fork length (cm)'; % average initial fork length of group
units.tL_f2 = {'d', 'cm'};  label.tL_f2 = {'time', 'fork length'};   
bibkey.tL_f2 = 'Daig2023'; 
comment.tL_f2 = 'forklength acquired using conversion from KeenMax1993'; 
%
% averaged F3 datasets 
% weight for f=X (high ration) group  
data.tWw_f3 = [ 0 35 77 112 135 ; %F3 (high group) time in days
                3262.9 3474.9 3661.9 3808.9 3847.5 ]'; % average body weight at each time point
temp.tWw_f3 = C2K(17.8);  units.temp.tWw_f3 = 'K'; label.temp.tWw_f3 = 'temperature (K)'; 
Ww0.tWw_f3 = 3262.9; units.Ww0.tWw_f3 = 'g'; label.Ww0.tWw_f3 = 'initial wet weight (g)'; % average initial wet weight of group
units.tWw_f3 = {'d', 'g'};  label.tWw_f3 = {'time', 'wet weight'};   
bibkey.tWw_f3 = 'Daig2023'; 
comment.tWw_f3 = 'fed same ration for 4.5 months, beginning at day 0, f= HIGH'; 

% fork length for f=X (high ration) group 
data.tL_f3 = [ 0 35 77 112 135 ; % F3 (high group) time in days
               81.2 82.1 82.9 83.3 84.8 ]'; % average fork length at each time point   
temp.tL_f3 = C2K(17.8);  units.temp.tL_f3 = 'K'; label.temp.tL_f3 = 'temperature (K)'; 
Lw0.tL_f3 = 81.2; units.Lw0.tL_f3 = 'cm'; label.Lw0.tL_f3 ='initial fork length (cm)'; % average initial fork length of group
units.tL_f3 = {'d', 'cm'};  label.tL_f3 = {'time', 'fork length'};   
bibkey.tL_f3 = 'Daig2023'; 
comment.tL_f3 = 'forklength acquired using conversion from KeenMax1993'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f1 = 2 * weights.tWw_f1;     
weights.tL_f1 = 2 * weights.tL_f1;
weights.tWw_f2 = 4 * weights.tWw_f2;
weights.tL_f2 = 4 * weights.tL_f2;
weights.tWw_f3 = 2 * weights.tWw_f3;
weights.tL_f3 = 2 * weights.tL_f3;
weights.Ri = 2 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.Ww0 = Ww0; 
auxData.Lw0 = Lw0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
set3 = {'tL_f1', 'tL_f2', 'tL_f3'}; subtitle3 = {'3 feeding groups'};
set4 = {'tWw_f1', 'tWw_f2', 'tWw_f3'}; subtitle4 = {'3 feeding groups'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: Wwi is assumed to include gonads'; 
D3 = 'mod_1: Refs for tp and tp_m included data on reproductive maturity (ready to spawn) and spawning periodicity (freq. of spawning). We subtracted the average of reproductive readiness by the shortest periodicity for males (1y) and females (2y) to get our estimates of puberty';
D4 = 'mod_2: ab, tp, Li, Wwb, Wwi, Ri data revised; tL_fi and tWw_fi data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4); 

%% Facts
F1 = 'length-weight: Ww in g = 0.00407*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase';
F2 = 'The pallid sturgeon is the largest freshwater fish in North America';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '79TKJ'; % Cat of Life           
metaData.links.id_ITIS = '161081'; % ITIS      
metaData.links.id_EoL = '205909'; % Ency of Life
metaData.links.id_Wiki = 'Scaphirhynchus_albus'; % Wikipedia
metaData.links.id_ADW = 'Scaphirhynchus_albus'; % ADW
metaData.links.id_Taxo = '42456'; % Taxonomicon
metaData.links.id_WoRMS = '1425016'; % WoRMS
metaData.links.id_fishbase = 'Scaphirhynchus-albus'; % fishbase

%% References
bibkey = 'Choj2022'; type = 'Article'; bib = [ ...    % for age at birth zero-variate
'author = {K.A. Chojnacki and M.J. Dodson and A.E. George and J.S. Candrl and A.J. DeLonay}, ' ...
'year  = {2022}, ' ...
'title = {Ontogenetic development of pallid sturgeon (\emph{Scaphirhynchus albus}) and shovelnose sturgeon (\emph{Scaphirhynchus platorynchus}) from hatch through yolk absorption}, ' ...  
'journal = {Ecology of Freshwater Fish}, ' ...
'volume = {32}, ' ...
'number = {1}, ' ...
'doi = {10.1111/eff.12680},' ...
'pages = {209--231}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Holm2018'; type = 'Article'; bib = [ ...    % for age at puberty 1/2 zero-variate
'author = {L.M. Holmquist and C.S. Guy and A. Tews and M.A.H. Webb}, ' ...
'year  = {2018}, ' ...
'title = {First maturity and spawning periodicity of hatchery-origin pallid sturgeon in the upper {M}issouri {R}iver above {F}ort {P}eck {R}eservoir, {M}ontana}, ' ...  
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {35}, ' ...
'number = {1}, ' ...
'doi = {10.1111/jai.13751},' ...
'pages = {138--148}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cox2022'; type = 'Article'; bib = [ ...    % for age at puberty 2/2 zero-variate
'author = {T.L. Cox and C.S. Guy and L.M. Holmquist and M.A.H. Webb}, ' ...
'year  = {2022}, ' ...
'title = {Reproductive indices and observations of mass ovarian follicular atresia in hatchery-origin pallid sturgeon}, ' ...  
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {38}, ' ...
'number = {4}, ' ...
'doi = {10.1111/jai.14339},' ...
'pages = {391--402}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hame2020'; type = 'Article'; bib = [ ...    % for life span zero-variate
'author = {M.J. Hamel and J.J. Spurgeon and K.D. Steffensen and M.A. Pegg}, ' ...
'year  = {2020}, ' ...
'title = {Uncovering unique plasticity in life history of an endangered centenarian fish}, ' ...  
'journal = {Scientific Reports}, ' ...
'volume = {10}, ' ...
'number = {12866}, ' ...
'doi = {10.1038/s41598-020-69911-1},' ...
'pages = {1--10}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shum2006'; type = 'Article'; bib = [ ...    % for ultimate fork length zero-variate
'author = {D.A. Shuman and D.W. Willis and S.C. Krentz}, ' ...
'year  = {2006}, ' ...
'title = {Application of a length-categorization system for pallid sturgeon (\emph{Scaphirhynchus albus})}, ' ...  
'journal = {Journal of Freshwater Ecology}, ' ...
'volume = {21}, ' ...
'number = {1}, ' ...
'doi = {10.1080/02705060.2006.9664098},' ...
'pages = {71--76}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeLo2016'; type = 'techreport'; bib = [ ...  % for wet weight at birth zero-variate
'author = {A.J. DeLonay and K.A. Chojnacki and R.B. Jacobson and P.J. Braaten and K.J. Buhl et al.}, ' ...
'institution = {U.S. Department of the Interior; U.S. Geological Survey}, ' ...
'number = {1013}, ' ...
'year  = {2016}, ' ...
'title = {Ecological requirements for pallid sturgeon reproduction and recruitment in the Missouri River - Annual Report 2014}, ' ... 
'howpublished = {https://pubs.usgs.gov/of/2016/1013/ofr20161013.pdf}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'USFWS2019'; type = 'Misc'; bib = [...        %for ultimate wet weight zero-variate
'author = {U.S. Fish and Wildlife Service}, ' ...     
'year = {2019}, ' ...
'note = {USFWS live database, unpublished}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Keen1992'; type = 'Article'; bib = [ ...     % for maximum reproduction rate zero-variate
'author = {K.D. Keenlyne and E.M. Grossman and L.G. Jenkins}, ' ...
'year  = {1992}, ' ...
'title = {Fecundity of the pallid sturgeon}, ' ...  
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {121}, ' ...
'number = {1}, ' ...
'doi = {10.1577/1548-8659(1992)121<0139:FOTPS>2.3.CO;2},' ...
'pages = {139--140}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KeenMax1993'; type = 'Article'; bib = [ ...    % for uni-variate LW dataset
'author = {K.D. Keenlyne and S.J. Maxwell}, ' ...
'year  = {1993}, ' ...
'title = {Length conversions and length-weight relations for pallid sturgeon}, ' ...  
'journal = {North American Journal of Fisheries Management}, ' ...
'volume = {13}, ' ...
'number = {2}, ' ...
'doi = {10.1577/1548-8675(1993)013<0395:LCALWR>2.3.CO;2},' ...
'pages = {395--397}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KeenJenk1993'; type = 'Article'; bib = [ ...    % for uni-variate tL, tWw, tL_m, tWw_m datasets
'author = {K.D. Keenlyne and L.G. Jenkins}, ' ...
'year  = {1993}, ' ...
'title = {Age at sexual maturity of the pallid sturgeon}, ' ...  
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {122}, ' ...
'number = {3}, ' ...
'doi = {10.1577/1548-8659(1993)122<0393:AASMOT>2.3.CO;2},' ...
'pages = {393--396}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Daig2023'; type = 'Article'; bib = [ ...    % for uni-variate datasets tWw_f and tL_f for f1-3 
'author = {N.J. Daigle and M.A. Djokic and K.M Kappenman and T.G. Gaylord and S. Quinn and C.E. Verhille}, ' ...
'year  = {2023}, ' ...
'title = {Validation of a microwave energy meter to non-lethally estimate energetic reserves in adult sturgeon}, ' ...  
'journal = {Conservation Physiology}, ' ...
'volume = {11}, ' ...
'number = {1}, ' ...
'doi = {10.1093/conphys/coad023},' ... 
'pages = {1--10}']; % growth data were collected in this study but not included in publication, contact corresponding author for data
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Scaphirhynchus-albus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

