function [data, auxData, metaData, txtData, weights] = mydata_Pseudanodonta_complanata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Pseudanodonta_complanata'; 
metaData.species_en = 'Depressed river mussel'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'Ri'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2020 10 08];      

%% set data
% zero-variate data

data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Negu1966';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .0254;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Jirk1986';  
  comment.Lb = 'value for Actinonaias_ligamentina';
data.Lp  = 2.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 2 yr and tL data';
data.Li  = 9.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Jans2015';

data.Wwi  = 15.5;   units.Wwi  = 'g';  label.Wwi  = 'body wet weight at shell length 8.2 cm';   bibkey.Wwi  = 'Negu1966';
  comment.Wwi = 'value for Anodonta anatina';

data.Ri = 15e3/365;    units.Ri = '#/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'ReisArau2016';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'value for Unio tumidiformis';
 
% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.936	1.590
1.959	2.656
2.959	3.561
3.981	4.324
4.935	4.906
6.000	5.387
6.999	5.928
7.909	6.410
8.995	6.729
9.927	7.251];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Aldr1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Facultative hermaphroditic';
metaData.bibkey.F1 = 'Aldr1999'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7STRD'; % Cat of Life
metaData.links.id_ITIS = '985496'; % ITIS
metaData.links.id_EoL = '59272571'; % Ency of Life
metaData.links.id_Wiki = 'Pseudanodonta_complanata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39453'; % Taxonomicon
metaData.links.id_WoRMS = '1337670'; % WoRMS
metaData.links.id_molluscabase = '1337670'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudanodonta_complanata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/3061929}}';
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

