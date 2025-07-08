function [data, auxData, metaData, txtData, weights] = mydata_Unio_crassus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Unio_crassus'; 
metaData.species_en = 'Thick shelled river mussel'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp','TA'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};
metaData.data_1     = {'t-L'; 'L-Wd'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 02];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HelaValo2016';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'unio'; 
  comment.Lp = 'based on tp 4 yr and tL data';
data.Li  = 8;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HelaValo2016';
  comment.Li = 'Jans2017 gives 7 cm';

data.Ri = 1e5/365;    units.Ri = '#/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'unio';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'value for Unio species is not specified';
 
% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
3.903	3.498
5.813	4.355
5.885	4.516
5.957	4.629
5.976	3.335
6.919	4.580
6.999	4.159
8.011	5.728
9.062	4.627
9.928	6.066
9.931	5.905
11.914	6.777
11.981	7.246
11.985	7.003
12.871	7.083
12.959	6.080
13.926	5.723
13.975	7.406
14.058	6.775
14.124	7.341
14.898	4.962
14.940	7.163
15.068	8.506
15.903	7.016
17.146	7.970
24.064	5.149];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HelaValo2016';
comment.tL = 'Data from River Vantaa, Finland';

% length - weight
data.LWd = [ ... % shell weight (g), shell length (yr)
2.601	3.794
2.972	3.897
5.204	4.691
5.386	4.515
5.948	4.971
6.038	4.824
6.132	4.926
6.408	4.868
10.030	5.868
10.942	5.235
11.140	5.956
11.422	6.250
11.500	5.441
12.344	6.132
17.075	7.206
17.258	7.088
17.531	6.868
18.363	6.926
19.482	7.500
20.492	7.118
22.248	7.206
22.807	7.426
24.929	7.279
30.670	8.044
44.536	8.500];
data.LWd = data.LWd(:,[2 1]); % first length, then weight
data.LWd(:,2) = data.LWd(:,2)/ 20; % convert to AFDW of body  
units.LWd = {'cm', 'g'}; label.LWd = {'shell length', 'AFDW'};  
bibkey.LWd = 'HelaValo2016';
comment.LWd = 'based on the assumtion that AFDW is 5 percent of shell weight';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
metaData.links.id_CoL = '7DLCV'; % Cat of Life
metaData.links.id_ITIS = '983714'; % ITIS
metaData.links.id_EoL = '4750570'; % Ency of Life
metaData.links.id_Wiki = 'Unio_crassus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39455'; % Taxonomicon
metaData.links.id_WoRMS = '1044116'; % WoRMS
metaData.links.id_molluscabase = '1044116'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Unio_crassus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
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
bibkey = 'Aldr1999'; type = 'Article'; bib = [ ... 
'author = {David C. Aldridge}, ' ... 
'year = {1999}, ' ...
'title = {THE MORPHOLOGY, GROWTH AND REPRODUCTION OF {U}NIONIDAE ({B}IVALVIA) IN A FENLAND WATERWAY}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {65}, ' ...
'pages = {47-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jirk1986'; type = 'phdthesis'; bib = [ ... 
'author = {Kurt J. Jirka}, ' ... 
'year = {1986}, ' ...
'title = {Reproductive biology and comparative growth rates of selected species of freshwater mussels ({B}ivalvia: {U}nionidae) in the {N}ew and {G}reenbrier {R}ivers, {V}irginia and {W}est {V}irginia}, ' ...
'school = {Virginia Polytechnic Institute and State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HelaValo2016'; type = 'Article'; bib = [ ...
'doi = {10.1002/aqc.2698}, ' ...
'author = {Samuli Helama and Ilmari Valovirta and Jan Kresten Nielsen}, ' ... 
'year = {2016}, ' ...
'title = {Growth characteristics of the endangered thick-shelled river mussel (\emph{Unio crassus}) near the northern limit of its natural range}, ' ...
'journal = {Aquatic Conserv: Mar. Freshw. Ecosyst.}'];
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

