  function [data, auxData, metaData, txtData, weights] = mydata_Tantilla_melanocephala
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Tantilla_melanocephala'; 
metaData.species_en = 'Black-headed snake'; 

metaData.ecoCode.climate = {'Aw', 'Am', 'Dwa', 'Dfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 17]; 

%% set data
% zero-variate data
data.am = 19*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 11;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'MarqPuor1998';
  comment.Lb = '10 to 12 cm';
data.Lp = 22.5;     units.Lp = 'cm';     label.Lp = 'total length at puberty for females'; bibkey.Lp = 'MarqPuor1998'; 
data.Lpm = 27;     units.Lpm = 'cm';     label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'MarqPuor1998'; 
data.Li = 39;     units.Li = 'cm';     label.Li = 'ultimate total length for females';  bibkey.Li = 'MarqPuor1998';
data.Lim = 30;     units.Lim = 'cm';     label.Lim = 'ultimate total length for males';  bibkey.Lim = 'MarqPuor1998';

data.Wwi = 9.33;    units.Wwi = 'g';    label.Wwi = 'ulitmate weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Micrurus_fulvius: (39/59.6)^3*33.3';
data.Wwim = 4.2;    units.Wwim = 'g';    label.Wwim = 'ulitmate weight for males';  bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Micrurus_fulvius: (30/59.6)^3*33.3';

data.Ri = 3/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'MarqPuor1998';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch, 1 clutch per yr';
   
% univariate data
% time - length
data.tL = [ ... % time since birth (d), total length (cm)
74.364	10.920
75.485	11.669
77.707	11.045
86.255	11.919
105.920	10.296
143.095	15.101
148.637	12.106
164.975	12.106
178.716	12.356
195.822	15.164
283.089	16.037
299.816	18.034
318.762	18.970
365+13.937	21.404
365+16.173	22.215
365+20.581	17.098
365+39.882	16.349
365+45.480	19.407
365+57.721	18.034
365+58.111	20.094
365+61.038	15.413
365+84.116	21.529
365+84.129	22.902
365+91.533	20.530];
data.tL(:,1) = data.tL(:,1) - 74; % set origin of time at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MarqPuor1998';
comment.tL = 'data based on length frequencies';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Main food:centipede Otostigmus sp. (Scolopendridae)';
metaData.bibkey.F1 = 'MarqPuor1998'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54PHT'; % Cat of Life
metaData.links.id_ITIS = '209446'; % ITIS
metaData.links.id_EoL = '2816562'; % Ency of Life
metaData.links.id_Wiki = 'Tantilla_melanocephala'; % Wikipedia
metaData.links.id_ADW = 'Tantilla_melanocephala'; % ADW
metaData.links.id_Taxo = '604878'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Tantilla&species=melanocephala'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tantilla_melanocephala}}';
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
bibkey = 'MarqPuor1998'; type = 'Article'; bib = [ ...  
'author = {Otavio A.V. Marques and Giuseppe Puorto}, ' ...
'year = {1998}, ' ...
'title = {Feeding, reproduction and growth in the crowned snake \emph{Tantilla melanocephala} ({C}olubridae), from southeastern {B}razil}, ' ... 
'journal = {Amphibia-Reptilia}, ' ...
'volume = {19}, '...
'pages = {311-318}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 


