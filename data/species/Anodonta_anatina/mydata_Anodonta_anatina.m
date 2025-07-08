function [data, auxData, metaData, txtData, weights] = mydata_Anodonta_anatina

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Anodonta_anatina'; 
metaData.species_en = 'Duck mussel'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};
metaData.data_1     = {'t-L_f'; 't-Ww'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2020 10 08];      

%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Negu1966';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .0254;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Jirk1986';  
  comment.Lb = 'value for Actinonaias_ligamentina';
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 2 yr and tL data';
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Jans2015';

data.Ri = 15e3/365;    units.Ri = '#/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'ReisArau2016';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'values for Unio tumidiformis';
 
% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
1.009	2.651
2.015	4.465
2.989	5.595
4.018	6.307
5.003	6.726
6.002	7.047
7.015	7.437
8.001	8.051
8.944	8.553
9.971	8.791];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length', 'River Thames at Reading'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Negu1966';
comment.tL = 'Data from River Thames at Reading';
%
data.tL1 = [ ... % time since birth (yr), shell length (cm)
0.983	2.276
2.072	3.382
3.006	4.367
3.984	5.171
4.983	5.753
6.048	6.294
6.979	6.654
7.889	7.015
8.953	7.395
9.995	7.634
10.971	8.054
11.946	8.152
12.966	8.532
13.985	8.489
14.939	8.930
15.982	9.592];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'Wicken Lode, Cambridgeshire'};  
temp.tL1 = C2K(17);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Aldr1999';
comment.tL1 = 'Data from Wicken Lode, Cambridgeshire';

% time-weight
data.tWw = [ ... % time since birth (yr), body weight (g)
    1  0.34
    2  1.2
    3  2.8 
    4  4.5
    5  5.9
    6  7.1
    7  8.3
    8  9.8
    9 11.3
   10 13.2
   11 15.3];
data.tWw(:,1) = 365 * (0 + data.tWw(:,1));
units.tWw = {'d', 'g'}; label.tWw = {'time', 'body weight', 'River Thames at Reading'};  
temp.tWw = C2K(17);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Negu1966';
comment.tWw = 'Data from River Thames at Reading';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tWw = 5 * weights.tWw;
weights.Li = 10 * weights.Li;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from River Thames, Wicken Lode'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Facultative hermaphroditic';
metaData.bibkey.F1 = 'Aldr1999'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66TV4'; % Cat of Life
metaData.links.id_ITIS = '983681'; % ITIS
metaData.links.id_EoL = '47020899'; % Ency of Life
metaData.links.id_Wiki = 'Anodonta_anatina'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '155548'; % Taxonomicon
metaData.links.id_WoRMS = '881461'; % WoRMS
metaData.links.id_molluscabase = '881461'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anodonta_anatina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/4749267}}';
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
bibkey = 'Negu1966'; type = 'Article'; bib = [ ... 
'author = {Christina L. Negus}, ' ... 
'year = {1966}, ' ...
'title = {A Quantitative Study of Growth and Production of {U}nionid Mussels in the {R}iver {T}hames at {R}eading}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {35(3)}, ' ...
'pages = {513-532}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReisArau2016'; type = 'Article'; bib = [ ... 
'author = {Joaquim Reis  and Rafael Araujo}, ' ... 
'year = {2016}, ' ...
'title = {Life history of the freshwater mussel \emph{Unio tumidiformis} ({B}ivalvia: {U}nionidae) in a temporary {M}editerranean-type stream}, ' ...
'journal = {Invertebrate Biology}, ' ...
'volume = {135(1)}, ' ...
'pages = {31-45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jirk1986'; type = 'phdthesis'; bib = [ ... 
'author = {Kurt J. Jirka}, ' ... 
'year = {1986}, ' ...
'title = {Reproductive biology and comparative growth rates of selected species of freshwater mussels ({B}ivalvia: {U}nionidae) in the {N}ew and {G}reenbrier {R}ivers, {V}irginia and {W}est {V}irginia}, ' ...
'school = {Virginia Polytechnic Institute and State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aldr1999'; type = 'Article'; bib = [ ... 
'author = {David C. Aldridge}, ' ... 
'year = {1999}, ' ...
'title = {THE MORPHOLOGY, GROWTH AND REPRODUCTION OF {U}NIONIDAE ({B}IVALVIA) IN A FENLAND WATERWAY}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {65}, ' ...
'pages = {47-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jans2015'; type = 'Book'; bib = [ ... 
'author = {Jansen, B.}, ' ...
'year = {2015}, ' ...
'title  = {Veldgids Slakken en mossels}, ' ...
'publisher = {KNNV, Zeist}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


