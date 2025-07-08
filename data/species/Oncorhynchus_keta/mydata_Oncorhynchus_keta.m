function [data, auxData, metaData, txtData, weights] = mydata_Oncorhynchus_keta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Oncorhynchus_keta'; 
metaData.species_en = 'Chum salmon'; 

metaData.ecoCode.climate = {'MC','Dfc'};
metaData.ecoCode.ecozone = {'MPN','TH'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjCi', 'jiCii', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(7); 
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-dL'; 'L-N'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 01 11];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'}; 

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'sta@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 01 11]; 


%% set data
% zero-variate data

data.ab = 60;    units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'fishbase';  
  temp.ab = C2K(9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'fishbase';           
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Lb =  1.6;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'fishbase';
data.Lp  = 40;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Beac1982';
data.Li  = 92;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
  comment.Li = 'based on total length of 1 m';
  
data.Wwb = 0.1575;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';  
  comment.Wwb = 'based on egg diameter of 6.7 mm: pi/6*0.67^3';
data.Wwi = 15.9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';

% Uni-variated data
% time-change in length
data.tdL_f = [ % ... % time since birth (yr), change in length (cm/yr)
0	18.137 % spawning at 3
1	16.368 % spawning at 3
2	12.919 % spawning at 3
3	12.748 % spawning at 3
0	16.208 % spawning at 4
1	15.018 % spawning at 4
2	12.533 % spawning at 4
3	8.9740 % spawning at 4
4	9.3270 % spawning at 4
0	17.448 % spawning at 5
1	15.321 % spawning at 5
2	14.599 % spawning at 5
3	10.682 % spawning at 5
4	10.043 % spawning at 5
5	8.054];% spawning at 5 
data.tdL_f(:,1) = (0.5 + data.tdL_f(:,1)) * 365; % convert yr to d
data.tdL_f(:,2) = data.tdL_f(:,2)/ 365; % convert cm/yr to cm/d
units.tdL_f   = {'d', 'cm/d'};  label.tdL_f = {'time since birth', 'change in length', 'female'};  bibkey.tdL_f = 'UrbaKang2012';
temp.tdL_f    = C2K(7);  units.temp.tdL_f = 'K'; label.temp.tdL_f = 'temperature'; 
comment.tdL_f = 'data for females';
%
data.tdL_m = [ % ... % time since birth (yr), change in length (cm/yr)
0	17.697 % spawning at 2 
1	17.366 % spawning at 2 
2	12.435 % spawning at 2 
0	17.559 % spawning at 3
1	15.190 % spawning at 3
2	13.647 % spawning at 3
3	9.9830 % spawning at 3
0	19.267 % spawning at 4
1	16.182 % spawning at 4
2	15.052 % spawning at 4
3	12.160 % spawning at 4
4	10.121]; % spawning at 4  
data.tdL_m(:,1) = (0.5 + data.tdL_m(:,1)) * 365; % convert yr to d
data.tdL_m(:,2) = data.tdL_m(:,2)/ 365; % convert cm/yr to cm/d
units.tdL_m   = {'d', 'cm/d'};  label.tdL_m = {'time since birth', 'change in length', 'male'};  bibkey.tdL_m = 'UrbaKang2012';
temp.tdL_m    = C2K(7);  units.temp.tdL_m = 'K'; label.temp.tdL_m = 'temperature'; 
comment.tdL_m = 'data for males';

% length-fecundity
data.LN = [ ... % postorbital-hypural length (cm), fecundity (#)
58.4 3078
60.7 3325
63.0 3512
59.0 3257
58.1 3408
57.6 3293
59.1 3279
57.1 3122
60.1 3481
58.9 3306
53.3 2659
57.5 2684
58.7 2659
51.6 2018
55.9 2567
56.8 2711
58.8 2555
54.6 2448
63.6 2448
59.3 3280
64.3 3977
63.1 3629
57.1 2856
57.0 2688
61.1 3374
59.1 3262
60.5 3343
59.6 3502
57.5 2935];
data.LN(:,1) = 1.1*data.LN(:,1); % convert postorbital-hypural length to fork length
[n, i] = sort(data.LN(:,1)); data.LN = data.LN(i,:); n = size(data.LN,1);
for i = 2:n
    if data.LN(i,1) <= data.LN(i-1,1)
       data.LN(i,1) = max(data.LN(i-1,1), data.LN(i,1)) + 1e-2;
    end
end
units.LN   = {'cm', '#'};  label.LN = {'postorbital-hypural length', 'fecundity'};  bibkey.LN = 'Beac1982';
temp.LN    = C2K(7);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
comment.LN = 'fishbase: spawns 2 or 3 times, then dies';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.tdL_f = 5 * weights.tdL_f;
weights.tdL_m = 5 * weights.tdL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tdL_f','tdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed' ;
D3 = '2 spawns assumed in fecundity data' ;
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '49JF6'; % Cat of Life
metaData.links.id_ITIS = '161976'; % ITIS
metaData.links.id_EoL = '46563136'; % Ency of Life
metaData.links.id_Wiki = 'Oncorhynchus_keta'; % Wikipedia
metaData.links.id_ADW = 'Oncorhynchus_keta'; % ADW
metaData.links.id_Taxo = '42805'; % Taxonomicon
metaData.links.id_WoRMS = '127183'; % WoRMS
metaData.links.id_fishbase = 'Oncorhynchus-keta'; % fishbase


%% References%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oncorhynchus_keta}}';
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
bibkey = 'UrbaKang2012'; type = 'Article'; bib = [ ... 
'author = {Davnah Urbach and Minho Kang and Sukyung Kang and Ki Baek Seong and Suam Kim and Ulf Dieckmann and Mikko Heino}, ' ... 
'year = {2012}, ' ...
'title = {Growth and maturation of {K}orean chum salmon under changing environmental conditions}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {134-136}, ' ...
'pages = {104-112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beac1982'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z82-195}, ' ...
'author = {Beacham, T. D.}, ' ... 
'year = {1982}, ' ...
'title = {Fecundity of coho salmon (\emph{Oncorhynchus kisutch}) and chum salmon (\emph{O. keta}) in the northeast {P}acific {O}cean}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {60}, ' ...
'pages = {1463-1469}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Oncorhynchus-keta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
