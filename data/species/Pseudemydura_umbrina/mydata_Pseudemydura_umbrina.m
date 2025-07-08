function [data, auxData, metaData, txtData, weights] = mydata_Pseudemydura_umbrina 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Pseudemydura_umbrina'; 
metaData.species_en = 'Western Swamp Turtle'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'; 't-L_f';'t-Ww_f'; 'T-JO'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney', 'Sophie Arnall'};  
metaData.date_subm = [2015 09 25];
metaData.email    = {'sophie.arnall@research.uwa.edu.au'};
metaData.address  = {'University of Western Australia, 6009, Australia'};

metaData.author_mod_1   = {'Michael Kearney', 'Sophie Arnall'};  
metaData.date_mod_1     = [2017 12 25];
metaData.email_mod_1    = {'sophie.arnall@research.uwa.edu.au'};
metaData.address_mod_1  = {'University of Western Australia, 6009, Australia'};

metaData.author_mod_2   = {'Michael Kearney', 'Sophie Arnall'};  
metaData.date_mod_2     = [2017 12 26];
metaData.email_mod_2    = {'sophie.arnall@research.uwa.edu.au'};
metaData.address_mod_2  = {'University of Western Australia, 6009, Australia'};

metaData.author_mod_3   = {'Michael Kearney', 'Sophie Arnall'};  
metaData.date_mod_3     = [2017 12 27];
metaData.email_mod_3    = {'sophie.arnall@research.uwa.edu.au'};
metaData.address_mod_3  = {'University of Western Australia, 6009, Australia'};

metaData.author_mod_4   = {'Michael Kearney', 'Sophie Arnall', 'Bas Kooijman'};  
metaData.date_mod_4     = [2017 12 28];
metaData.email_mod_4    = {'sophie.arnall@research.uwa.edu.au'};
metaData.address_mod_4  = {'University of Western Australia, 6009, Australia'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 28];


%% set data

data.ab = 153;         units.ab = 'd';     label.ab = 'age at birth';                  bibkey.ab = 'Arna2018';                                
  comment.ab = 'Average of 8 individuals born in captivity that were incubated at 24oC constant for entire incubation period (range 126-172 days; born prior to May 1; IDs 942, 945, 946, 991, 997, 1086, 1087, 1088)';
temp.ab = C2K(24.532); units.temp.ab = 'K'; label.temp.ab = 'temperature';                                                                                                                        
  comment.ab = 'K, temperature; actual temp in incubator (confirmed constant; retrospective correction incubators 1,2 and 4)';

data.ap = 3767;     units.ap = 'd';     label.ap = 'age at puberty';                bibkey.ap = 'Arna2018';                                
  comment.ap = 'temperature; approximate CTE from NicheMapR simulation. Average time for the 12 adult females born in captivity to have first become gravid (scanned gravid; IDs 261, 324, 378, 468, 490, 496, 501, 504, 525, 618, 635, 728)';
temp.ap = C2K(18.7);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  
 data.am = 36500;    units.am = 'd';     label.am = 'life span';                     bibkey.am = 'Arna2018';                                
  comment.am = 'UNKNOWN. Best guess: certainly greater than 61 years (females acquired as adults in 1963 are still producing viable clutches), likely 80-100 (G. Kuchling pers comm.)';   
temp.am = C2K(18.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'K, temperature; approximate CTE from NicheMapR simulation';
  
data.Lb  = 2.6;      units.Lb  = 'cm';   label.Lb  = 'carapace length at birth';      bibkey.Lb  = 'Arna2018';                                
  comment.Lb  = 'Average of ab individuals';
data.Lp  = 10.7;     units.Lp  = 'cm';   label.Lp  = 'carapace length at puberty';    bibkey.Lp  = 'Arna2018';                                
  comment.Lp = 'Average of ap individuals, taken at first instance of being gravid';
data.Li  = 13.1;     units.Li  = 'cm';   label.Li  = 'ultimate carapace length';      bibkey.Li  = {'Arna2018', 'BurbKuch2010'};      
  comment.Li = 'Best guess, based on CZ2 (largest female) who has grown less than 3mm in 10 years; "Females do not grow beyond 135mm carapace length" (BurbKuch2010)';
  
data.Wwb = 5.2;      units.Wwb = 'g';    label.Wwb = 'wet weight at birth';           bibkey.Wwb = {'Arna2018', 'BurbKuch2010'};      
  comment.Wwb  = 'Average of ab individuals';
data.Wwp = 236.5;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'Arna2018';                                
  comment.Wwp = 'Average of ap individuals, taken at first instance of being gravid';
data.Wwi = 417;      units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'Arna2018';                                
  comment.Wwi = 'Best guess, based on maximum weight recorded for CZ2 (largest female; 417.1g); "Females do not exceed 410g" (BurbKuch2010); revision from 408g in Burb1981';

data.Ri  = 5/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';           bibkey.Ri  = 'Burb1981';                                             
temp.Ri = C2K(18.7);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Females lay 3-5 eggs';   
 
%% uni-variate data
%==========================================================================  
% METABOLIC DATA; n=8

OTW = readtable('Pseudemydura_umbrina_VO2.csv','TreatAsEmpty',{'NA'});
data.TO = cat(2,table2array(OTW(:,2)),table2array(OTW(:,1)));
%data.TO = cat(2,table2array(OTW(:,2)),0.013*table2array(OTW(:,3)).^0.800.*10.^(0.038.*table2array(OTW(:,2)))./table2array(OTW(:,3))); 
units.TO = {'degrees C','ml g-1 h-1'}; label.TO = {'Temperature','O2 Consumption Rate'};  bibkey.TO = 'ArnaKuch2015';

%==========================================================================
% TIME LENGTH WEIGHT DATA; n=6
tLW = readtable('Pseudemydura_umbrina_growth.csv','TreatAsEmpty',{'NA'});
tLW = sortrows(tLW,3);

data.tW = cat(2,table2array(tLW(:,3)),table2array(tLW(:,5)));
units.tW = {'d', 'g'};     label.tW = {'Age', 'Wet Weight'};  bibkey.tW = 'Arna2018';

data.tL = cat(2,table2array(tLW(:,3)),table2array(tLW(:,4)));
units.tL = {'d', 'cm'};  label.tL = {'Age', 'Carapce Length'};  bibkey.tL = 'Arna2018';

data.LW = cat(2,table2array(tLW(:,4)),table2array(tLW(:,5)));
units.LW = {'cm', 'g'}; label.LW = {'Carapace Length', 'Wet Weight'};  bibkey.LW = 'Arna2018';

%% set weights for all real data
weights = setweights(data, []);
weights.TO = 0 * weights.TO;

%% overwriting weights
% weights.ab = weights.ab * 1;
% weights.ap = weights.ap * 1;
% weights.am = weights.am * 10;
% weights.Wwb = weights.Wwb * 10;
% weights.Wwp = weights.Wwp * 10;
% weights.Wwi = weights.Wwi * 10;
% weights.Lb = weights.Lb * 10;
% weights.Lp = weights.Lp * 10;
% weights.Li = weights.Li * 10;
% weights.Ri = weights.Ri * 10;
% weights.LW = weights.LW * 10;
% weights.tW = weights.tW * 10;
% weights.tL = weights.tL * 10;
% weights.TO = weights.TO * 1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Depressed state assumed ([p_M], v, k_J, reduced), during summer and embryo';
D2 = 'This is the "Typical p_M" model of P. umbrina as presented in ArnaMitc2018';
D3 = 'Predicted respiration data much higher than measure; weights set to zero';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'All stages experience torpor, and torpor is implemented by letting f switch backwards and forwards from f_zoo to 0';
metaData.bibkey.F1 = 'Arna2018'; 
F2 = 'Torpor occurs approximately late-December until mid-May every year (zoo popn)';
metaData.bibkey.F2 = 'Arna2018'; 
F3 = 'Mating occurs after torpor in the pond, approximately July-August (zoo popn)';
metaData.bibkey.F3 = 'Arna2018'; 
F4 = 'Egg laying occurs before torpor, approximately November-December'; 
metaData.bibkey.F4 = 'Arna2018'; 
F5 = 'Torpor seems required for reproduction';
metaData.bibkey.F5 = 'Kuch2017'; 
F6 = 'Average mass loss over torpor period is 7.9%, no corresponding significant change to length (0.2mm; 2012-2013 data collected by S. Arnall)';
metaData.bibkey.F6 = 'Arna2018'; 
F7 = 'Some individuals occasionally undergo a half-torpor season due to being used in the public exhibit pond';
metaData.bibkey.F7 = 'Arna2018'; 
F8 = 'All coupling/mating, entry into torpor, and exit from torpor is artificially imposed by staff at Perth Zoo. Females may have been capable of becoming gravid ealier if given opportunity to mate prior.';
metaData.bibkey.F8 = 'Arna2018'; 
 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5,'F6',F6,'F7',F7,'F8',F8);
  
%% Links
metaData.links.id_CoL = '4NM9G'; % Cat of Life
metaData.links.id_ITIS = '551853'; % ITIS
metaData.links.id_EoL = '793828'; % Ency of Life
metaData.links.id_Wiki = 'Pseudemydura_umbrina'; % Wikipedia
metaData.links.id_ADW = 'Pseudemydura_umbrina'; % ADW
metaData.links.id_Taxo = '48233'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pseudemydura&species=umbrina'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Arna2018'; type = 'Misc'; bib = [...
  'author = {Arnall, S.}, ' ...
  'note  = {unplublished data}, ' ...
  'year = {2018}'];
   metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
  bibkey = 'BurbKuch2010'; type = 'Techreport'; bib = [ ... 
  'author = {Burbidge, A. A. and Kuchling, G. and Olejnik, C. and Mutter, L.}, ' ...
  'year = {2010}, ' ...
  'title  = {Western Swamp Tortoise (\emph{Pseudemydura umbrina}) recovery plan, 4th edition}, ' ...
  'institution = {Department of Parks and Wildlife, Western Australia}'];
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
  bibkey = 'Burb1981'; type = 'Article'; bib = [ ... 
  'author = {Burbidge, A. A.}, ' ... 
  'year = {1981}, ' ...
  'title = {The ecology of the western swamp tortoise \emph{Pseudemydura umbrina} ({T}estudines: {C}helidae)}, ' ...
  'journal = {Australian Wildlife Research}, ' ...
  'volume = {8}, ' ...
  'pages = {203--223}'];
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
  bibkey = 'ArnaKuch2015'; type = 'Article'; bib = [ ... 
  'author = {Arnall, S. and Kuchling, G. and Mitchell, N.}, ' ... 
  'year = {2015}, ' ...
  'title = {A thermal profile of metabolic performance in the rare {A}ustralian chelid, \emph{Pseudemydura umbrina}}, ' ...
  'journal = {Australian Journal of Zoology}, ' ...
  'volume = {62}, ' ...
  'pages = {448--453}'];
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
  bibkey = 'ArnaMitc2018'; type = 'Article'; bib = [ ... 
  'author = {Arnall, S. G. and Mitchell, N. J. and Kuchling, G. and Durell, B. and Kooijman, S. A. L. M. and Kearney, M. R.}, ' ... 
  'year = {2018}, ' ...
  'title = {Life in the slow lane? {A} {D}ynamic {E}nergy {B}udget model for \emph{Psuedemydura umbrina}}, ' ...
  'journal = {Journal of Sea Research}, ' ...
  'note = {to appear}'];
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
  bibkey = 'Kuch2017'; type = 'Misc'; bib = [ ... 
  'author = {Kuchling, G.}, ' ... 
  'note = {pers. obs.}, ' ...
  'year = {2017}'];
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 