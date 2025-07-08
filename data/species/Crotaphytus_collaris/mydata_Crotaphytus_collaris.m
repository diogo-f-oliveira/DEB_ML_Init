function [data, auxData, metaData, txtData, weights] = mydata_Crotaphytus_collaris

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Crotaphytidae';
metaData.species    = 'Crotaphytus_collaris';
metaData.species_en = 'Common collared lizard';

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-dL'; 'L-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 08];

%% set data
% zero-variate data;
data.ab = 60;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'Fitc1956';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '57-64 d';
data.am = 8*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on 5 yr for Gambelia';

data.Lb  = 4.2;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Fitc1956';
data.Lp  = 8.4;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Fitc1956';
data.Li  = 10.3;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Fitc1956';
data.Lim  = 10.7;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Fitc1956';
 
data.Wwi  = 40;   units.Wwi  = 'g';  label.Wwi  = 'ultimate weight for females';   bibkey.Wwi  = 'Fitc1956';
data.Wwim  = 46;   units.Wwim  = 'g';  label.Wwim  = 'ultimate weight for males';   bibkey.Wwim  = 'Fitc1956';

data.Ri  = 7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Fitc1956';
temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-12 eggs per clutch, 1 clutch per yr';

% univariate data
% time - length
data.tL = [ ... % time since birth (d),  SVL (cm)
0.046	4.215
11.633	4.567
24.400	5.623
33.209	6.152
46.477	7.116
60.458	7.668];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fitc1956';

% length - change in length
data.LdL_f = [ ... % SVL (cm), change in SVL (cm/d)
    4.77 0.071
    6.46 0.052
    7.70 0.030
    8.35 0.020
    
    6.21 0.0426
    8.62 0.0226];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL','females'};  
temp.LdL_f   = C2K(24);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Fitc1956';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (cm/d)
    4.77 0.071
    6.46 0.052
    7.70 0.030
    8.35 0.020
    
    6.305 0.0531
    8.808 0.0281];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL','males'};  
temp.LdL_m   = C2K(24);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'Fitc1956';

% length-weight
data.LW_f = [ ... % SVL (cm), weight (g)
    6.7  19.4
    7.6  15.7
    8.4  19.5
    8.8  25
    9.3  28
    9.5  31
    5.5   7.5
    5.9   7.7
    6.0   8.4
    6.9  11.8
    7.7  17.3
    8.6  22.1
    9.0  25.2
    9.4  30.5
    9.3  27
    9.6  34
    9.7  27
   10.0  27
   10.0  37
   10.0  42
   10.1  38
   10.2  44
    6.05  8.5
    6.4  10
    7.9  17.3
    8.95 22.9
    9.4  30.3
    9.6  34
    9.7  35
    9.7  32
   10.0  39
   10.2  24
   10.3  40
    7.6  15.1
    8.4  23.2
    8.7  20
    9.5  28
    9.6  33];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'wet weight', 'females'};  
bibkey.LW_f = 'Fitc1956';
%
data.LW_m = [ ... % SVL (cm), weight (g)
    6.5  12.1
    8.3  20.5
    8.9  25.5
    9.1  28.2
    9.85 39.1
   10.6  43.5
   10.4  38
   10.6  44
   10.7  46
   10.7  42
    5.8   7
    6.5   8
    6.8   9.3
    9.2  18.7
    9.6  33
   10.2  38
    5.0   4
    7.6  15
    8.1  22
    8.4  22
    9.3  27
    9.6  32
   10.0  33
   10.3  42
   10.6  44
   10.5  45
    8.6  23.4
    8.8  25
    9.5  30
    9.9  30
   10.3  39
   10.4  47
   10.6  43
   10.5  43];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'wet weight', 'males'};  
bibkey.LW_m = 'Fitc1956';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'The large incubation time is hard to combine with the high growth rate';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6BJ77'; % Cat of Life
metaData.links.id_ITIS = '173912'; % ITIS
metaData.links.id_EoL = '47044590'; % Ency of Life
metaData.links.id_Wiki = 'Crotaphytus_collaris'; % Wikipedia
metaData.links.id_ADW = 'Crotaphytus_collaris'; % ADW
metaData.links.id_Taxo = '49006'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crotaphytus&species=collaris'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crotaphytus_collaris}}';   
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
bibkey = 'Fitc1956'; type = 'Article'; bib = [ ...
'author = {Fitch, H. S.}, ' ...
'title = {An ecological study of the collared lizard (\emph{Crotaphytus collaris})}, ' ...
'journal = {Univ. Kan. Publ. Mus. Nat. Hist.}, ' ...
'volume = {8}, ' ...
'pages = {213-274}, ' ...
'year = {1956}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


