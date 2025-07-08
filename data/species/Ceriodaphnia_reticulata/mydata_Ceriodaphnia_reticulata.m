function [data, auxData, metaData, txtData, weights] = mydata_Ceriodaphnia_reticulata
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Ceriodaphnia_reticulata'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'C','D'};
metaData.ecoCode.ecozone = {'TH','TP','TN'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 31]; 

%% set data
% zero-variate data

data.ab = 16/24;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'GansLeit2013';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GansLeit2013';   
  temp.tp = C2K(28);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on Lp and tL data';
data.am = 40;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.038; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'GansLeit2013';
data.Lp  = 0.069; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Burg1967';
data.Li  = 0.17;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nina';
data.Lim  = 0.08;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length of males';   bibkey.Lim  = 'nina';

data.Wdi = 3.47e-5;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'based on C. dubia: 6.71e-6*(0.17/0.09832)^3';
   
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mum)
 0	37.571
 1	39.548
 2	51.412
 3	58.333
 4	67.232
 5	76.130
 6	82.062
 7	87.006
 8	89.972
 9	91.949
10	96.893
11	97.881
12	101.836
13	104.802
14	104.802];
data.tL(:,2) = data.tL(:,2)/ 1e3; % convert mum to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GansLeit2013';
comment.tL = 'the assumption is that the units in GansLeit2013 are wrong by a factor 10';

% length-fecundity
data.LN = [ ... length (mum), number of eggs (#)
688.267	3.557
692.595	3.346
692.787	4.149
695.122	2.926
698.983	4.426
702.352	3.867
704.153	4.075
707.380	2.922
709.315	3.689
712.350	5.400
712.408	1.977
712.842	3.793
715.369	3.373
728.544	3.543
737.608	4.832
741.686	3.573
759.306	4.021
766.052	2.936
780.145	6.947
796.990	7.814
802.318	8.127
815.944	6.516
827.685	8.013
829.061	6.441
830.487	8.746
833.547	6.894
837.375	8.254
839.768	7.276
843.387	7.763
849.900	9.367
854.586	10.658];
data.LN(:,1) = data.LN(:,1)/ 1e4; % convert mum to cm
units.LN  = {'cm', '#'};  label.LN = {'length','fecundity'};  
temp.LN   = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Burg1967';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tp = 0 * weights.tp;
% weights.Lb = 3 * weights.Lb;
% weights.Li = 3 * weights.Li;
weights.LN = 3 * weights.LN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 50 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SY6Z'; % Cat of Life
metaData.links.id_ITIS = '83906'; % ITIS
metaData.links.id_EoL = '46498278'; % Ency of Life
metaData.links.id_Wiki = 'Ceriodaphnia'; % Wikipedia
metaData.links.id_ADW = 'Ceriodaphnia_reticulata'; % ADW
metaData.links.id_Taxo = '125123'; % Taxonomicon
metaData.links.id_WoRMS = '148400'; % WoRMS

%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Ceriodaphnia%%20reticulata.pdf}}';
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
bibkey = 'GansLeit2013'; type = 'Article'; bib = [ ... 
'author = {G\''{a}ndara, Mario and Leite, Rossevel and Caraballo, Pedro}, ' ... 
'year = {2013}, ' ...
'title = {HISTORY OF LIFE OF \emph{Daphnia magna} AND \emph{Ceriodaphnia reticulata} IN LABORATORY CONDITIONS: POTENTIAL USE AS FEED FOR FISHES}, ' ...
'journal = {Rev. Colombiana cienc. Anim}, ' ...
'volume = {5(2)}, ' ...
'pages = {340-357}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Burg1967'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3015}, ' ...
'author = {Mary J. Burgis}, ' ... 
'year = {1967}, ' ...
'title = {A Quantitative Study of Reproduction in Some Species of \emph{Ceriodaphnia} ({C}rustacea: {C}ladocera)}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {36(1)}, ' ...
'pages = {61-75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
